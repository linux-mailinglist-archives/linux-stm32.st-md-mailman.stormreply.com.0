Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C6EB1486F
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:48:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E0C1BC349C1;
	Tue, 29 Jul 2025 06:48:54 +0000 (UTC)
Received: from smtp.blochl.de (mail.blochl.de [151.80.40.192])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8455C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Jul 2025 20:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.blochl.de B84804466439
Authentication-Results: mail.blochl.de;
 dmarc=none (p=none dis=none) header.from=blochl.de
Authentication-Results: mail.blochl.de; spf=fail smtp.mailfrom=blochl.de
Received: from workknecht.fritz.box (ppp-93-104-0-143.dynamic.mnet-online.de
 [93.104.0.143])
 by smtp.blochl.de (Postfix) with ESMTPSA id B84804466439;
 Sun, 13 Jul 2025 20:21:45 +0000 (UTC)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.4.2 at 472b552e6fe8
From: =?utf-8?q?Markus_Bl=C3=B6chl?= <markus@blochl.de>
Date: Sun, 13 Jul 2025 22:21:41 +0200
MIME-Version: 1.0
Message-Id: <20250713-stmmac_crossts-v1-1-31bfe051b5cb@blochl.de>
X-B4-Tracking: v=1; b=H4sIAFQVdGgC/x3MSQqAMAxA0atI1hY6KA5XEZFao2ZhK00RQby7x
 eVb/P8AYyRk6IsHIl7EFHyGKgtwu/UbClqyQUtdy0YZwek4rJtcDMyJhamW1s5t10llIUdnxJX
 ufziAxwTj+37rhsIvZQAAAA==
X-Change-ID: 20250713-stmmac_crossts-34d8ab89901a
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: b4 0.14.2
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4
 (smtp.blochl.de [0.0.0.0]); Sun, 13 Jul 2025 20:21:46 +0000 (UTC)
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: markus.bloechl@ipetronik.com, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org,
 John Stultz <jstultz@google.com>,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
 =?utf-8?q?Markus_Bl=C3=B6chl?= <markus@blochl.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net] net: stmmac: intel: populate entire
 system_counterval_t in get_time_fn() callback
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

Z2V0X3RpbWVfZm4oKSBjYWxsYmFjayBpbXBsZW1lbnRhdGlvbnMgYXJlIGV4cGVjdGVkIHRvIGZp
bGwgb3V0IHRoZQplbnRpcmUgc3lzdGVtX2NvdW50ZXJ2YWxfdCBzdHJ1Y3QgYXMgaXQgbWF5IGJl
IGluaXRpYWxseSB1bmluaXRpYWxpemVkLgoKVGhpcyBicm9rZSB3aXRoIHRoZSByZW1vdmFsIG9m
IGNvbnZlcnRfYXJ0X3RvX3RzYygpIGhlbHBlciBmdW5jdGlvbnMKd2hpY2ggbGVmdCB1c2VfbnNl
Y3MgdW5pbml0aWFsaXplZC4KCkluaXRpYWxseSBhc3NpZ24gdGhlIGVudGlyZSBzdHJ1Y3Qgd2l0
aCBkZWZhdWx0IHZhbHVlcy4KCkZpeGVzOiBmNWUxZDBkYjNmMDIgKCJzdG1tYWM6IGludGVsOiBS
ZW1vdmUgY29udmVydF9hcnRfdG9fdHNjKCkiKQpDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwpT
aWduZWQtb2ZmLWJ5OiBNYXJrdXMgQmzDtmNobCA8bWFya3VzQGJsb2NobC5kZT4KLS0tCk5vdGVz
OgogICAgUmVsYXRlZC1UbzogPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvdHh5cnIyNmh4
ZTN4cHEzZWJxYjVld2tndmh2cDd4YWxvdGFvdXdsdWRqdGppZm5haDJAN3RtZ2N6bG40YW9vLz4K
ICAgIFJlbGF0ZWQtVG86IDxodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjUwNzA5LWUx
MDAwZV9jcm9zc3RzLXYyLTEtMmFhZTk0Mzg0YzU5QGJsb2NobC5kZS8+CiAgICBPbmx5IGNvbXBp
bGUgdGVzdGVkCi0tLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMt
aW50ZWwuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0
bW1hYy9kd21hYy1pbnRlbC5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMv
ZHdtYWMtaW50ZWwuYwppbmRleCA5YTQ3MDE1MjU0YmJlNjBiODA2YjAwYjgwZGJkNWIxZDhmNzhh
N2M2Li5lYTMzYWUzOWJlNmJiY2E1ZGMzMmM3M2U2ZDAyZTg2YTlkOGQ2ZTYyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1pbnRlbC5jCisrKyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWludGVsLmMKQEAgLTQz
Myw2ICs0MzMsMTIgQEAgc3RhdGljIGludCBpbnRlbF9jcm9zc3RzdGFtcChrdGltZV90ICpkZXZp
Y2UsCiAJCXJldHVybiAtRVRJTUVET1VUOwogCX0KIAorCSpzeXN0ZW0gPSAoc3RydWN0IHN5c3Rl
bV9jb3VudGVydmFsX3QpIHsKKwkJLmN5Y2xlcyA9IDAsCisJCS5jc19pZCA9IENTSURfWDg2X0FS
VCwKKwkJLnVzZV9uc2VjcyA9IGZhbHNlLAorCX07CisKIAludW1fc25hcHNob3QgPSAocmVhZGwo
aW9hZGRyICsgR01BQ19USU1FU1RBTVBfU1RBVFVTKSAmCiAJCQlHTUFDX1RJTUVTVEFNUF9BVFNO
U19NQVNLKSA+PgogCQkJR01BQ19USU1FU1RBTVBfQVRTTlNfU0hJRlQ7CkBAIC00NDgsNyArNDU0
LDcgQEAgc3RhdGljIGludCBpbnRlbF9jcm9zc3RzdGFtcChrdGltZV90ICpkZXZpY2UsCiAJfQog
CiAJc3lzdGVtLT5jeWNsZXMgKj0gaW50ZWxfcHJpdi0+Y3Jvc3N0c19hZGo7Ci0Jc3lzdGVtLT5j
c19pZCA9IENTSURfWDg2X0FSVDsKKwogCXByaXYtPnBsYXQtPmZsYWdzICY9IH5TVE1NQUNfRkxB
R19JTlRfU05BUFNIT1RfRU47CiAKIAlyZXR1cm4gMDsKCi0tLQpiYXNlLWNvbW1pdDogM2NkNzUy
MTk0ZTJlYzI1NzNkMGU3NDBmNGExZWRiZmNjMjgyNTdmNQpjaGFuZ2UtaWQ6IDIwMjUwNzEzLXN0
bW1hY19jcm9zc3RzLTM0ZDhhYjg5OTAxYQoKQmVzdCByZWdhcmRzLAotLSAKTWFya3VzIEJsw7Zj
aGwgPG1hcmt1c0BibG9jaGwuZGU+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
