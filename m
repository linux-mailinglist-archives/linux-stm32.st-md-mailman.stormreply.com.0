Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4247BD6A6
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 11:22:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 417C2C6B442;
	Mon,  9 Oct 2023 09:22:42 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E426CC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 09:22:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qpmTE-0006sS-FJ; Mon, 09 Oct 2023 11:22:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qpmTB-000NWK-WD; Mon, 09 Oct 2023 11:22:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qpmTB-00C4om-Lw; Mon, 09 Oct 2023 11:22:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Mon,  9 Oct 2023 10:38:36 +0200
Message-Id: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3496;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=pt9OZIbEVRO7CYphejzNzNKVBdTQOuLMQfjMm/xdSsg=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhlTl3b98hd42/517xHB/gviiPU/9MqwUZ0mXf7uieqT57
 e1Tr4s5OxmNWRgYuRhkxRRZ7BvXZFpVyUV2rv13GWYQKxPIFAYuTgGYiNF79n9mT5b+PJ2R+ikl
 wLMnduL/rK7Z79ojXnBnnL3QVfV6IeOf7r+yDxdeUQ/VNbcoUj9/TSL8bE71Y7sDqxerpXI6VEs
 /1P97Z0YuT218uWOkw/O0NY6abDVGc6fHL8n96l+lGaq7OrdAK4Ax5VjhrnRrd5OA6peWBvlTb3
 AyXvpSMPXrLx65FXyMmsnHnqZ+uvjL8HBZBXOtsu7S3Jpkh9r2xaYef+NnftHqsljaMnF9yufEf
 1E6pW1rZr69u0fZs2RLfUdYQdgLp/hzIZpzmerWsjlmfmDdx9Wlc7RYWop3kxrz7+18KXNuV655
 FaFwVYNlX9ml35+UxAPLrx9fo8B+cpJOMQ9zsGQi0zFOAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: alsa-devel@alsa-project.org, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 Jesper Nilsson <jesper.nilsson@axis.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Yangtao Li <frank.li@vivo.com>, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Lars Persson <lars.persson@axis.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 patches@opensource.cirrus.com, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH 00/20] pinctrl: Convert to platform remove
	callback returning void
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

SGVsbG8sCgphZnRlciB0aHJlZSBtaW5vciBpbXByb3ZlbWVudHMvc2ltcGxpZmljYXRpb25zIHRo
aXMgc2VyaWVzIGNvbnZlcnRzIGFsbApwbGF0Zm9ybV9kcml2ZXJzIGJlbG93IGRyaXZlcnMvcGlu
Y3RybCB0byAucmVtb3ZlX25ldygpLgoKU2VlIGNvbW1pdCA1YzVhNzY4MGU2N2IgKCJwbGF0Zm9y
bTogUHJvdmlkZSBhIHJlbW92ZSBjYWxsYmFjayB0aGF0CnJldHVybnMgbm8gdmFsdWUiKSBmb3Ig
YW4gZXh0ZW5kZWQgZXhwbGFuYXRpb24gYW5kIHRoZSBldmVudHVhbCBnb2FsLgoKVGhlIG9ubHkg
aW50ZXJkZXBlbmRlbmNpZXMgaW4gdGhpcyBzZXJpZXMgYXJlIHRoZSBwYXRjaGVzIHRoYXQgdG91
Y2ggYQpzaW5nbGUgZHJpdmVyICh0aGF0IGlzICgxLCAxMyksICgyLCAxMiksICgzLCAyMCkpLiBB
cyB0aGVyZSBhcmUgc3RpbGwKcXVpdGUgYSBmZXcgZHJpdmVycyB0byBjb252ZXJ0LCBJJ20gaGFw
cHkgYWJvdXQgZXZlcnkgcGF0Y2ggdGhhdCBtYWtlcwppdCBpbi4gU28gZXZlbiBpZiB0aGVyZSBp
cyBhIG1lcmdlIGNvbmZsaWN0IHdpdGggb25lIHBhdGNoIHVudGlsIHlvdQphcHBseSAob3IgYSBk
aWZmZXJlbnQgY29uY2VybiB0aGF0IGRvZXNuJ3QgYXBwbHkgdG8gYWxsIHBhdGNoZXMpLCBwbGVh
c2UKYXBwbHkgdGhlIHJlbWFpbmRlciBvZiB0aGlzIHNlcmllcyBhbnlob3cuIEknbGwgY29tZSBi
YWNrIHRvIHRoZSBwYXJ0CnRoYXQgeW91IChtYXliZSkgc2tpcHBlZCBhdCBhIGxhdGVyIHBvaW50
LgoKQmVzdCByZWdhcmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDIwKToKICBwaW5jdHJsOiBz
dG1meDogSW1wcm92ZSBlcnJvciBtZXNzYWdlIGluIC5yZW1vdmUoKSdzIGVycm9yIHBhdGgKICBw
aW5jdHJsOiBzaW5nbGU6IERyb3AgaWYgYmxvY2sgd2l0aCBhbHdheXMgZmFsc2UgY29uZGl0aW9u
CiAgcGluY3RybDogdGk6IHRpLWlvZGVsYXk6IERyb3AgaWYgYmxvY2sgd2l0aCBhbHdheXMgZmFs
c2UgY29uZGl0aW9uCiAgcGluY3RybDogY2lycnVzOiBtYWRlcmEtY29yZTogQ29udmVydCB0byBw
bGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sKICAgIHJldHVybmluZyB2b2lkCiAgcGluY3RybDogaW50
ZWw6IGNoZXJyeXZpZXc6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrCiAgICBy
ZXR1cm5pbmcgdm9pZAogIHBpbmN0cmw6IGludGVsOiBseW54cG9pbnQ6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrCiAgICByZXR1cm5pbmcgdm9pZAogIHBpbmN0cmw6IG5vbWFk
aWs6IGFieDUwMDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sKICAgIHJldHVy
bmluZyB2b2lkCiAgcGluY3RybDogYW1kOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxs
YmFjayByZXR1cm5pbmcgdm9pZAogIHBpbmN0cmw6IGFydHBlYzY6IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcGluY3RybDogYXMzNzIyOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHBpbmN0cmw6
IHJvY2tjaGlwOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZAogIHBpbmN0cmw6IHNpbmdsZTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQKICBwaW5jdHJsOiBzdG1meDogQ29udmVydCB0byBwbGF0Zm9ybSBy
ZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBwaW5jdHJsOiB0YjEweDogQ29udmVydCB0
byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBwaW5jdHJsOiBxY29t
OiBzcG1pLWdwaW86IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrCiAgICByZXR1
cm5pbmcgdm9pZAogIHBpbmN0cmw6IHFjb206IHNwbWktbXBwOiBDb252ZXJ0IHRvIHBsYXRmb3Jt
IHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcKICAgIHZvaWQKICBwaW5jdHJsOiBxY29tOiBzc2Jp
LWdwaW86IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrCiAgICByZXR1cm5pbmcg
dm9pZAogIHBpbmN0cmw6IHFjb206IHNzYmktbXBwOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5pbmcKICAgIHZvaWQKICBwaW5jdHJsOiByZW5lc2FzOiByem4xOiBD
b252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcKICAgIHZvaWQKICBw
aW5jdHJsOiB0aTogdGktaW9kZWxheTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nCiAgICB2b2lkCgogZHJpdmVycy9waW5jdHJsL2NpcnJ1cy9waW5jdHJsLW1h
ZGVyYS1jb3JlLmMgfCAgNiArKy0tLS0KIGRyaXZlcnMvcGluY3RybC9pbnRlbC9waW5jdHJsLWNo
ZXJyeXZpZXcuYyAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3BpbmN0cmwvaW50ZWwvcGluY3RybC1s
eW54cG9pbnQuYyAgICB8ICA1ICsrLS0tCiBkcml2ZXJzL3BpbmN0cmwvbm9tYWRpay9waW5jdHJs
LWFieDUwMC5jICAgICB8ICA1ICsrLS0tCiBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1hbWQuYyAg
ICAgICAgICAgICAgICB8ICA2ICsrLS0tLQogZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtYXJ0cGVj
Ni5jICAgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLWFzMzcy
Mi5jICAgICAgICAgICAgIHwgIDUgKystLS0KIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXJvY2tj
aGlwLmMgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zaW5n
bGUuYyAgICAgICAgICAgICB8ICA5ICsrLS0tLS0tLQogZHJpdmVycy9waW5jdHJsL3BpbmN0cmwt
c3RtZnguYyAgICAgICAgICAgICAgfCAxNiArKysrKysrKysrLS0tLS0tCiBkcml2ZXJzL3BpbmN0
cmwvcGluY3RybC10YjEweC5jICAgICAgICAgICAgICB8ICA2ICsrLS0tLQogZHJpdmVycy9waW5j
dHJsL3Fjb20vcGluY3RybC1zcG1pLWdwaW8uYyAgICAgfCAgNSArKy0tLQogZHJpdmVycy9waW5j
dHJsL3Fjb20vcGluY3RybC1zcG1pLW1wcC5jICAgICAgfCAgNSArKy0tLQogZHJpdmVycy9waW5j
dHJsL3Fjb20vcGluY3RybC1zc2JpLWdwaW8uYyAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvcGlu
Y3RybC9xY29tL3BpbmN0cmwtc3NiaS1tcHAuYyAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3Bp
bmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6bjEuYyAgICAgICB8ICA2ICsrLS0tLQogZHJpdmVycy9w
aW5jdHJsL3RpL3BpbmN0cmwtdGktaW9kZWxheS5jICAgICAgfCAxMSArKy0tLS0tLS0tLQogMTcg
ZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgNzMgZGVsZXRpb25zKC0pCgoKYmFzZS1j
b21taXQ6IDBiYjgwZWNjMzNhOGZiNWE2ODIyMzY0NDNjMWU3NDBkNWM5MTdkMWQKLS0gCjIuNDAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
