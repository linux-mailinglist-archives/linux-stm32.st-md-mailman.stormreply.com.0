Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C6F734E5B
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 10:46:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9FD32C6A61E;
	Mon, 19 Jun 2023 08:46:48 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C83C0C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Jun 2023 10:05:30 +0000 (UTC)
X-GND-Sasl: alexis.lothore@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686909930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/bEp3l+mxj4OHOGsH5hIH6F032OIg4YoPj77OR1PVdg=;
 b=CN6oOlMdpm4WJSEG9Jbl2Wjd46tk4pOqx3PJpvQUFS28VyPKOhJIzXXMAmdKxbZoDJBCBF
 JoQnBH/1OwhyK5EYtNKFAuTuYLn+wKnQdm5d3148b84eqOEbb2GqpStIXBULMgr/GqI3PW
 inIn+uWZzm9eOjKfFpWdkhjEkTwz6RwRoz6xQwCI+wz5YYweGyHzlPMVg8oKmCdbp64wbg
 b6lrf5upm8vJsR1FMAU5BV7kmFasB9rdxsrghFRdpDIF6FqNJx8qqNSfDk32ehYr9aCG1L
 7aP1VRYxjRJChWBxI3Hw9YKDxnz9LKauQv0hEUHRIGdxJuC7TpCb6pEcFk/8iA==
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
X-GND-Sasl: alexis.lothore@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id ABFB320004;
 Fri, 16 Jun 2023 10:05:28 +0000 (UTC)
From: alexis.lothore@bootlin.com
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
Date: Fri, 16 Jun 2023 12:04:01 +0200
Message-ID: <20230616100409.164583-1-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 19 Jun 2023 08:46:47 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
Subject: [Linux-stm32] [PATCH net-next 0/8] net: stmmac: enable timestamp
	snapshots for DWMAC1000
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

RnJvbTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCldoaWxl
IHRyeWluZyB0byB1c2UgdGhlIHJlY2VudGx5IGltcGxlbWVudGVkIGF1eGlsaWFyeSBzbmFwc2hv
dCBmZWF0dXJlCihbMV0pIG9uIEN5Y2xvbmUgViBwbGF0Zm9ybSAoZW1iZWRkaW5nIERXTUFDMTAw
MCBJUCksIEkgcmVhbGl6ZWQgdGhhdCBzb21lCnBhcnRzIGFyZSB0b28gdGlnaHRseSBjb3VwbGVk
IHRvIEdNQUM0IHZlcnNpb24gb2YgdGhlIElQLiBGb3IgZXhhbXBsZSwKdGltZXN0YW1wX2ludGVy
cnVwdCBmdW5jdGlvbiBpbiBzdG1tYWNfaHd0c3RhbXAuYyByZWFkcyBzb21lIHRpbWVzdGFtcApz
dGF0dXMgKEdNQUNfVElNRVNUQU1QX1NUQVRVUyksIHdoaWNoIG9mZnNldCBpcyByZWxldmFudCBm
b3IgR01BQzQgKHB0cGFkZHIKKyAweDIwKSwgYnV0IG5vdCBmb3IgR01BQzMgKHdoaWNoIHNob3Vs
ZCBiZSBwdHBhZGRyICsgMHgyOCkuCkFub3RoZXIgZXhhbXBsZSBpcyB0aGF0IGF1eGlsaWFyeSBz
bmFwc2hvdCB0cmlnZ2VyIGNvbmZpZ3VyYXRpb24gaXMgZG9uZSBpbgphIGRlZGljYXRlZCByZWdp
c3RlciBmb3IgR01BQzQsIHdoaWxlIGl0IGlzIGluIHRoZSBnZW5lcmFsIFRpbWVzdGFtcApjb250
cm9sIHJlZ2lzdGVyIGZvciBEV01BQzEwMDAuCgpUaGlzIHNlcmllcyBwcm9wb3NlcyB0byBzcGxp
dCB0aG9zZSB0b28gc3BlY2lmaWMgcGFydHMgaW4gZWFjaCBJUCB2YXJpYW50CmZpbGUuIERXTUFD
MTAwMCBtYXBwaW5nIGlzIGJhc2VkIG9uIEN5Y2xvbmUgViBIUFMgcmVnaXN0ZXIgbWFwIChbMl0p
IHdoaWxlCkdNQUM0IG1hcHBpbmcgaGFzIGJlZW4gY2hlY2tlZCBiYXNlZCBvbiBzb21lIEVsa2hh
cnQgTGFrZSByYW5nZSBwcm9jZXNzb3JzCm1hcHBpbmcgKFszXSkKCk9uZSBwb2ludCBJIGFtIG5v
dCBzdXJlIGFib3V0IGlzIGZvciBhbGwgb3RoZXIgdmFyaWFudHM6IHN1bjhpLWR3bWFjLApkd3hn
bWFjMiBhbmQgZHdtYWMxMDAuIEkgaGF2ZSBubyBjbHVlIGFib3V0IHJlZ2lzdGVycyBsYXlvdXQg
Zm9yIHRob3NlCnBsYXRmb3Jtcy4gSSB0aGVuIGhhZCB0byBwb3NzaWJsZSBhcHByb2FjaGVzIHRv
IGVuYWJsZSBmZWF0dXJlIG9uCkRXTUFDMTAwMDoKLSBlbnN1cmUgdGhhdCBjdXJyZW50IGJlaGF2
aW91ciBpcyBwcmVzZXJ2ZWQgZm9yIGR3eGdtYWMyLCBzdW44aS1kd21hYyBhbmQKICBkd21hYzEw
MDsga2VlcCBhdXhpbGlhcnkgc25hcHNob3QgZmVhdHVyZSBpbiBzdG1tYWNfcHRwLmMgYW5kIGFk
ZAogIGR3bWFjMTAwMCBiZWhhdmlvdXIgYXMgYW4gImV4Y2VwdGlvbiIKLSBhc3N1bWUgYXV4aWxp
YXJ5IHNuYXNwc2hvdHMgY29udHJvbHMgYXJlIGRpZmZlcmVudCBmb3IgZWFjaCwgdGhlbiBtb3Zl
IHRoZQogIGNvbnRyb2xzIGluIGVhY2ggSVAgdmVyc2lvbiBmaWxlIChYWFhYX2NvcmUuYykKSSBm
ZWx0IGxpa2Ugc3RtbWFjX3B0cC5jIHNob3VsZCByZW1haW4gaW5kZXBlbmRhbnQgZnJvbSB0aGUg
SVAgdmVyc2lvbiwgc28KSSBjaG9zZSB0aGUgc2Vjb25kIG9wdGlvbiwgYnV0IHNpbmNlIEkgZG8g
bm90IGtub3cgYWJvdXQgb3RoZXIgdmVyc2lvbnMKbGF5b3V0IChhbmQgZG8gbm90IGhhdmUgdGhl
IGhhcmR3YXJlKSwgSSBkaWQgbm90IHdpcmUgImJsaW5kbHkiIHRoZQpmZWF0dXJlIG9uIHRob3Nl
IHBsYXRmb3JtLgpQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBhbSB3cm9uZyBhbmQvb3IgaWYgSSBz
aG91bGQgY29tZSB3aXRoIGEgbW9yZQpjb25zZXJ2YXRpdmUgYXBwcm9hY2ggKGllIGZpcnN0IHZl
cnNpb24pCgpUZXN0ZWQgb24gQ3ljbG9uZSBWIHdpdGggdGVzdHB0cAoKWzFdIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL25ldGRldi8yMDIxMDQxNDAwMTYxNy4zNDkwLTEtdmVlLmtoZWUud29uZ0Bs
aW51eC5pbnRlbC5jb20vClsyXSBodHRwczovL2NkcmR2Mi5pbnRlbC5jb20vdjEvZGwvZ2V0Q29u
dGVudC82NjY5NjI/ZmlsZU5hbWU9Y3ZfNXY0LTY4MzEyNi02NjY5NjIucGRmClszXSBodHRwczov
L2NkcmR2Mi5pbnRlbC5jb20vdjEvZGwvZ2V0Q29udGVudC82MzY3MjI/ZmlsZU5hbWU9NjM2NzIy
X0VITCtEYXRhc2hlZXQrVjIrQm9vaysyX3JldjAwMy5wZGYKCkFsZXhpcyBMb3Rob3LDqSAoOCk6
CiAgbmV0OiBzdG1tYWM6IGFkZCBJUC1zcGVjaWZpYyBjYWxsYmFja3MgZm9yIGF1eGlsaWFyeSBz
bmFwc2hvdAogIG5ldDogc3RtbWFjOiBwb3B1bGF0ZSBkd21hYzQgY2FsbGJhY2tzIGZvciBhdXhp
bGlhcnkgc25hcHNob3RzCiAgbmV0OiBzdG1tYWM6IG1vdmUgUFRQIGludGVycnVwdCBoYW5kbGlu
ZyB0byBJUC1zcGVjaWZpYyBEV01BQyBmaWxlCiAgbmV0OiBzdG1tYWM6IG1vdmUgY29tbW9uIGRl
ZmluZXMgaW4gc3RtbWFjX3B0cC5oCiAgbmV0OiBzdG1tYWM6IHNldCBudW1iZXIgb2Ygc25hcHNo
b3QgZXh0ZXJuYWwgdHJpZ2dlcnMgZm9yIEdNQUMzCiAgbmV0OiBzdG1tYWM6IGludHJvZHVjZSBz
ZXR0ZXIvZ2V0dGVyIGZvciB0aW1lc3RhbXAgY29uZmlndXJhdGlvbgogIG5ldDogc3RtbWFjOiBk
byBub3Qgb3ZlcndyaXRlIG90aGVyIGZsYWdzIHdoZW4gd3JpdGluZyB0aW1lc3RhbXAKICAgIGNv
bnRyb2wKICBuZXQ6IHN0bW1hYzogZW5hYmxlIHRpbWVzdGFtcCBleHRlcm5hbCB0cmlnZ2VyIGZv
ciBkd21hYzEwMDAKCiAuLi4vZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5j
ICAgfCAgMiArCiAuLi4vbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjMTAwMC5oICAg
fCAxMiArKy0KIC4uLi9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYzEwMDBfY29yZS5jICB8
IDgzICsrKysrKysrKysrKysrKysrKwogZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1t
YWMvZHdtYWM0LmggIHwgMjkgKysrKystLQogLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1h
Yy9kd21hYzRfY29yZS5jIHwgODUgKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9uZXQvZXRo
ZXJuZXQvc3RtaWNyby9zdG1tYWMvaHdpZi5oICAgIHwgMTcgKysrLQogLi4uL2V0aGVybmV0L3N0
bWljcm8vc3RtbWFjL3N0bW1hY19od3RzdGFtcC5jIHwgNjIgKystLS0tLS0tLS0tLS0KIC4uLi9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYyB8IDE0ICstLQogLi4uL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcHRwLmMgIHwgMjkgKystLS0tLQogLi4u
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfcHRwLmggIHwgMjYgKy0tLS0tCiAx
MCBmaWxlcyBjaGFuZ2VkLCAyNDYgaW5zZXJ0aW9ucygrKSwgMTEzIGRlbGV0aW9ucygtKQoKLS0g
CjIuNDEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
