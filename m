Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2804786E38D
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Mar 2024 15:41:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD9CBC6C841;
	Fri,  1 Mar 2024 14:41:28 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 547DEC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Mar 2024 14:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=To:Cc:Date:Message-Id:Subject:Mime-Version:
 Content-Transfer-Encoding:Content-Type:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=LdN5qTEFtlumZuRQEi4VHY/eZtcQU0zxLhU2JW1rtWQ=; b=Z53nd8cp13KDoUb8MDu2wu0L3p
 ZHreIzI1KovhrJL5FOdTlhslLv9ItsqOnoJ2goAUQiKczxpIRBiOJ0E0wKKxP4zkpnAfng9SgYP7D
 DesdtktdS58DMSV5GIOiDXe8fFHuQFWGrlXxtXsTJh9UwcjcY5ypR9GygteBKJQWZBu6LUShnybxG
 RZVvG9aIfpCGbozljZ4065QpSPYgcSye6TvFg5O/Ovs6VY2OLWekVus2iV9wvK3PaZo2f7nZ3x5/1
 aqHZ1Y2hZ8mob3fdHVcABytT8OToh0avzTUBFuVp05A2KJuAOvhvpyZ+C/QpkzXk3nlll4xGiHc8X
 Y1ind1hQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1rg44e-00065E-Hy; Fri, 01 Mar 2024 15:41:20 +0100
Received: from [2a06:4004:10df:0:d47e:f3fd:21dc:d516] (helo=smtpclient.apple)
 by sslproxy07.your-server.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <sean@geanix.com>) id 1rg44d-000Kce-1a;
 Fri, 01 Mar 2024 15:41:19 +0100
From: Sean Nyekjaer <sean@geanix.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Message-Id: <4807FD7F-FEB5-4460-B1EB-3E2330864C8B@geanix.com>
Date: Fri, 1 Mar 2024 15:41:08 +0100
To: vkoul@kernel.org, kishon@kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, lgirdwood@gmail.com,
 broonie@kernel.org, u.kleine-koenig@pengutronix.de,
 Marc Kleine-Budde <mkl@pengutronix.de>, m.grzeschik@pengutronix.de,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, marex@denx.de, p.paillet@st.com,
 Olivier Moysan <olivier.moysan@foss.st.com>, l.goehrs@pengutronix.de,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: Apple Mail (2.3774.400.31)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27201/Fri Mar  1 10:25:20 2024)
Cc: =?utf-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [Linux-stm32] stm32mp1xx: use of reg11, reg18 and vdd_usb rails
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgYWxsLAoKV2UgYXJlIHVzaW5nIHRoZSBvc2QzMm1wMSBTSVAgbW9kdWxlIFswXS4KV2UgYXJl
IHNlZWluZyBzb21lIGhhcmR3YXJlIGdldOKAmXMgZnJpZWQgaW5zaWRlIHRoZSBTSVAgbW9kdWxl
LgpJdOKAmXMgc29tZXdoYXQgdHJhY2VkIGRvd24gdG8gdGhlIHVzYiBjb250cm9sbGVyL3BoeS9y
ZWd1bGF0b3IuCgpXaXRoIHRoaXMgZGV2aWNlIHRyZWVbMV0uIFdlIGhhdmUgbm90aWNlZCBkdXJp
bmcgYm9vdCB0aGUgcmVnMTggaXMgdG9nZ2xlZCBvbiBhbmQgb2ZmCndpdGhvdXQgdmRkX3VzYiBi
ZWluZyB0dXJuZWQgb2ZmIGJlZm9yZSByZWcxOCBhcyByZXF1aXJlZCBpbiB0aGUgZGF0YSBzaGVl
dFsyXSwgc2VjdGlvbiAzLjguMToKVkREM1YzX1VTQkhTIG11c3Qgbm90IGJlIHByZXNlbnQgdW5s
ZXNzIFZEREExVjhfUkVHIGlzIHByZXNlbnQsIG90aGVyd2lzZSBwZXJtYW5lbnQgClNUTTMyTVAx
NTdDL0YgZGFtYWdlIGNvdWxkIG9jY3VyLiBNdXN0IGJlIGVuc3VyZWQgYnkgUE1JQyByYW5raW5n
IG9yZGVyIG9yIHdpdGgKZXh0ZXJuYWwgY29tcG9uZW50IGluIGNhc2Ugb2YgZGlzY3JldGUgY29t
cG9uZW50IHBvd2VyIHN1cHBseSBpbXBsZW1lbnRhdGlvbi4KCkl04oCZcyBoYXBwZW5zIGJlY2F1
c2UgdGhlIHNvbWV0aGluZyBpcyBhbHJlYWR5IHVzZXMgdGhlIHZkZF91c2IsIGl04oCZcyBib3Ro
IHRoZSBkcml2ZXJzL3BoeS9zdC9waHktc3RtMzItdXNicGh5Yy5jCmFuZCBkcml2ZXJzL3JlZ3Vs
YXRvci9zdG0zMi1wd3IuYyB0aGF0IGNvbnN1bWVzIGl0LgoKSSBjYW4gZml4IGl0IGJ5IHJlbW92
aW5nIHRoZSB2ZGRfdXNiIGZyb20gdGhlIHVzYjMzIHN1cHBseVszXToKVGhlIHN0bTMyLXB3ci5j
IGlzICh0byBtZSkgcmF0aGVyIHdlaXJkLCBhcyBpdCBleHBvc2VzIHRoZSB1c2IzMyBhcyBhIHJl
Z3VsYXRvciB3aGVuIGluIGZhY3QgaXTigJlzIGEgZGV0ZWN0aW9uIHBpbi4KSXMgdGhhdCBkb25l
IG9uIHB1cnBvc2U/CgpJIHdvdWxkIGxpa2UgaW50cm9kdWNlIGEgZXJyb3IgaW4gdGhlIHN0bTMy
LXB3ci5jIGlmIHNvbWV0aGluZyBpcyB0cnlpbmcgdG8gcG93ZXIgb2ZmIHJlZzE4IHdpdGggdXNi
MzMgcHJlc2VudD8KV291bGQgaXQgYmUgb2theSB0byByZXR1cm4gLUVCVVNZPyBPciBldmVuIC1F
U01PS0U/IDopCgpPciBpcyBpdCBiZXR0ZXIgdG8gZG8gaXQgaW4gcGh5LXN0bTMyLXVzYnBoeWMu
Y1s0XT8KCi9TZWFuCgpbMF06IGh0dHBzOi8vb2N0YXZvc3lzdGVtcy5jb20vb2N0YXZvX3Byb2R1
Y3RzL29zZDMybXAxNXgvClsxXTogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvYXJjaC9hcm0vYm9vdC9kdHMvc3Qv
c3RtMzJtcDE1N2Mtb3NkMzJtcDEtcmVkLmR0cwpbMl06IGh0dHBzOi8vd3d3LnN0LmNvbS9yZXNv
dXJjZS9lbi9kYXRhc2hlZXQvc3RtMzJtcDE1N2MucGRmClszXToKZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxNTdjLW9zZDMybXAxLXJlZC5kdHMgYi9hcmNoL2FybS9i
b290L2R0cy9zdC9zdG0zMm1wMTU3Yy1vc2QzMm1wMS1yZWQuZHRzCmluZGV4IDUyN2MzM2JlNjZj
Yy4uMGQ2NzAwNjgwNmM0IDEwMDY0NAotLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1w
MTU3Yy1vc2QzMm1wMS1yZWQuZHRzCisrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAx
NTdjLW9zZDMybXAxLXJlZC5kdHMKQEAgLTE0OSw3ICsxNDksNiBAQCAmbV9jYW4xIHsKCiAmcHdy
X3JlZ3VsYXRvcnMgewogICAgICAgIHZkZC1zdXBwbHkgPSA8JnZkZD47Ci0gICAgICAgdmRkXzN2
M191c2Jmcy1zdXBwbHkgPSA8JnZkZF91c2I+OwogfTsKCiAmcnRjIHsKWzRdOgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9waHkvc3QvcGh5LXN0bTMyLXVzYnBoeWMuYyBiL2RyaXZlcnMvcGh5L3N0L3Bo
eS1zdG0zMi11c2JwaHljLmMKaW5kZXggZDVlN2U0NDAwMGI1Li41OGZjYzMwOTk4MDMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvcGh5L3N0L3BoeS1zdG0zMi11c2JwaHljLmMKKysrIGIvZHJpdmVycy9w
aHkvc3QvcGh5LXN0bTMyLXVzYnBoeWMuYwpAQCAtMTg4LDggKzE4OCwxOCBAQCBzdGF0aWMgaW50
IHN0bTMyX3VzYnBoeWNfcmVndWxhdG9yc19lbmFibGUoc3RydWN0IHN0bTMyX3VzYnBoeWMgKnVz
YnBoeWMpCgogc3RhdGljIGludCBzdG0zMl91c2JwaHljX3JlZ3VsYXRvcnNfZGlzYWJsZShzdHJ1
Y3Qgc3RtMzJfdXNicGh5YyAqdXNicGh5YykKIHsKKyAgICAgICBzdHJ1Y3Qgc3RtMzJfdXNicGh5
Y19waHkgKnVzYnBoeWNfcGh5OwogICAgICAgIGludCByZXQ7CgorICAgICAgIGZvciAocG9ydCA9
IDA7IHBvcnQgPCB1c2JwaHljLT5ucGh5czsgcG9ydCsrKSB7CisgICAgICAgICAgICAgICB1c2Jw
aHljX3BoeSA9IHVzYnBoeWMtPnBoeXNbcG9ydF07CisKKyAgICAgICAgICAgICAgIGlmKHJlZ3Vs
YXRvcl9pc19lbmFibGVkKHVzYnBoeWNfcGh5LT5waHktPnB3cikpIHsKKyAgICAgICAgICAgICAg
ICAgICAgICAgcHJfZXJyKCIlczogcGh5IGlzIHBvd2VyZWQgbm90IGFsbG93ZWQgdG8gc3dpdGNo
IG9mZiByZWd1bGF0b3JcbiIsIF9fZnVuY19fKTsKKyAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIC1FQlVTWTsKKyAgICAgICAgICAgICAgIH0KKyAgICAgICB9CisKICAgICAgICByZXQgPSBy
ZWd1bGF0b3JfZGlzYWJsZSh1c2JwaHljLT52ZGRhMXY4KTsKICAgICAgICBpZiAocmV0KQogICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
