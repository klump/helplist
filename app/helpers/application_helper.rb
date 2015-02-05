module ApplicationHelper
  # try to get the room and group from the IP address
  def request_ip
    remote_ip = request.env["HTTP_X_FORWARDED_FOR"]
    remote_ip = request.env["HTTP_X_REAL_IP"] if remote_ip.nil?
    remote_ip = request.remote_ip if remote_ip.nil?

    return remote_ip
  end
end
