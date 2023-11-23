Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5C77F6484
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Nov 2023 17:57:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92FE1C6B476;
	Thu, 23 Nov 2023 16:57:36 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87E38C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Nov 2023 16:57:35 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6D0e-0004y4-H4; Thu, 23 Nov 2023 17:57:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6D0c-00B54T-1D; Thu, 23 Nov 2023 17:56:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r6D0b-006oyt-MO; Thu, 23 Nov 2023 17:56:57 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Date: Thu, 23 Nov 2023 17:56:28 +0100
Message-ID: <20231123165627.492259-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3352;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Q2ANcXWy9TC81erakNzOyDSTdR+/U1VFHGOAdofAsV8=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhtT4FutYj8mdnjlcu3aa+Ft1S9SnzrXmZiri0Fqz9Yqkp
 G5vV0EnozELAyMXg6yYIot945pMqyq5yM61/y7DDGJlApnCwMUpABN59JODoc+rL23LJtbpW6Yf
 XeWk7h3bY+jUahfzU3diuLGe88F88yT2yspFn/40pCvKe7F0924zjVXtvXRzytJg0Wl3JwjZflo
 gavhwZs2r1uAn28qUnjmfmn8jSHu6fRq3yx+OxssmHq7XJKMPr5bsePTq5OLO9PxZjad7NlnVBD
 DKl8Y90TcUWX39doAHg2bWk8C821wuG7oXGMitPzSRcWdVBvM+HotPK/NOeh5eKfLR7Plhs7lrt
 lYe0Hz+ov09e7pG0U9Zv/abtfvWqJgafWjwW55jOePN8rN+AfX6vpfa+DQrtp1+xTb1yYJdaRxS
 DzI5Hmk5epjYs6S5vu77F2r/urq51mzGkQtzfp7658sIAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-omap@vger.kernel.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: [Linux-stm32] [PATCH v2 00/18] mfd: Convert to platform remove
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

SGVsbG8sCgp0aGlzIHNlcmllcyBjb252ZXJ0cyBhbGwgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBk
cml2ZXJzL21mZCB0byB1c2UKLnJlbW92ZV9uZXcoKS4gQ29tcGFyZWQgdG8gdGhlIHRyYWRpdGlv
bmFsIC5yZW1vdmUoKSBjYWxsYmFjawoucmVtb3ZlX25ldygpIHJldHVybnMgbm8gdmFsdWUuIFRo
aXMgaXMgYSBnb29kIHRoaW5nIGJlY2F1c2UgdGhlIGRyaXZlcgpjb3JlIGRvZXNuJ3QgKGFuZCBj
YW5ub3QpIGNvcGUgZm9yIGVycm9ycyBkdXJpbmcgcmVtb3ZlLiBUaGUgb25seSBlZmZlY3QKb2Yg
YSBub24temVybyByZXR1cm4gdmFsdWUgaW4gLnJlbW92ZSgpIGlzIHRoYXQgdGhlIGRyaXZlciBj
b3JlIGVtaXRzIGEKd2FybmluZy4gVGhlIGRldmljZSBpcyByZW1vdmVkIGFueWhvdyBhbmQgYW4g
ZWFybHkgcmV0dXJuIGZyb20gLnJlbW92ZSgpCnVzdWFsbHkgeWllbGRzIHJlc291cmNlIGxlYWtz
IGFuZC9vciB1c2UtYWZ0ZXItZnJlZSBidWdzLgoKU2VlIGNvbW1pdCA1YzVhNzY4MGU2N2IgKCJw
bGF0Zm9ybTogUHJvdmlkZSBhIHJlbW92ZSBjYWxsYmFjayB0aGF0CnJldHVybnMgbm8gdmFsdWUi
KSBmb3IgYW4gZXh0ZW5kZWQgZXhwbGFuYXRpb24gYW5kIHRoZSBldmVudHVhbCBnb2FsLgoKQWxs
IGRyaXZlcnMgY29udmVydGVkIGhlcmUgYWxyZWFkeSByZXR1cm5lZCB6ZXJvIHVuY29uZGl0aW9u
YWxseSBpbgoucmVtb3ZlKCksIHNvIHRoZXkgYXJlIGNvbnZlcnRlZCBoZXJlIHRyaXZpYWxseS4K
CkNvbXBhcmVkIHRvIHRoZSAoaW1wbGljaXQpIHYxWzFdIEkgYWRkZWQgdHdvIHJldmlldyB0YWdz
IGFuZCByZWJhc2VkIHRvCnRvZGF5J3MgbmV4dC9tYXN0ZXIuIEFsc28gSSBmYWlsZWQgdG8gQ2M6
IGFsbCBwYXRjaGVzIG9mIHYxIHRvIGxrbWwuCgpCZXN0IHJlZ2FyZHMKVXdlCgpbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMTA2MTcxNzA4LjM4OTIzNDctMS11LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGUKClV3ZSBLbGVpbmUtS8O2bmlnICgxOCk6CiAgbWZkOiBhYjg1
MDAtc3lzY3RybDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5n
CiAgICB2b2lkCiAgbWZkOiBjcm9zX2VjX2RldjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtZmQ6IGV4eW5vcy1scGFzczogQ29udmVydCB0byBw
bGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtZmQ6IGZzbC1pbXgyNS10
c2FkYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAgICB2
b2lkCiAgbWZkOiBoaTY1NXgtcG1pYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQKICBtZmQ6IGludGVsLWxwc3MtYWNwaTogQ29udmVydCB0byBwbGF0
Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAgICB2b2lkCiAgbWZkOiBrZW1wbGQtY29y
ZTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBt
ZmQ6IG1jcC1zYTExeDA6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZyB2b2lkCiAgbWZkOiBteHMtbHJhZGM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNh
bGxiYWNrIHJldHVybmluZyB2b2lkCiAgbWZkOiBvbWFwLXVzYi1ob3N0OiBDb252ZXJ0IHRvIHBs
YXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIG1mZDogb21hcC11c2ItdGxs
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIG1m
ZDogcGNmNTA2MzMtYWRjOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1
cm5pbmcgdm9pZAogIG1mZDogcWNvbS1wbTh4eHg6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgbWZkOiBzbTUwMTogQ29udmVydCB0byBwbGF0Zm9y
bSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtZmQ6IHN0bTMyLXRpbWVyczogQ29u
dmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtZmQ6IHRp
X2FtMzM1eF90c2NhZGM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZwogICAgdm9pZAogIG1mZDogdHBzNjU5MTEtY29tcGFyYXRvcjogQ29udmVydCB0byBwbGF0
Zm9ybSByZW1vdmUgY2FsbGJhY2sKICAgIHJldHVybmluZyB2b2lkCiAgbWZkOiB0d2w0MDMwLWF1
ZGlvOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAoK
IGRyaXZlcnMvbWZkL2FiODUwMC1zeXNjdHJsLmMgICAgICB8IDYgKystLS0tCiBkcml2ZXJzL21m
ZC9jcm9zX2VjX2Rldi5jICAgICAgICAgfCA1ICsrLS0tCiBkcml2ZXJzL21mZC9leHlub3MtbHBh
c3MuYyAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9tZmQvZnNsLWlteDI1LXRzYWRjLmMgICAg
IHwgNiArKy0tLS0KIGRyaXZlcnMvbWZkL2hpNjU1eC1wbWljLmMgICAgICAgICB8IDUgKystLS0K
IGRyaXZlcnMvbWZkL2ludGVsLWxwc3MtYWNwaS5jICAgICB8IDYgKystLS0tCiBkcml2ZXJzL21m
ZC9rZW1wbGQtY29yZS5jICAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9tZmQvbWNwLXNhMTF4
MC5jICAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvbWZkL214cy1scmFkYy5jICAgICAgICAg
ICB8IDYgKystLS0tCiBkcml2ZXJzL21mZC9vbWFwLXVzYi1ob3N0LmMgICAgICAgfCA1ICsrLS0t
CiBkcml2ZXJzL21mZC9vbWFwLXVzYi10bGwuYyAgICAgICAgfCA1ICsrLS0tCiBkcml2ZXJzL21m
ZC9wY2Y1MDYzMy1hZGMuYyAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9tZmQvcWNvbS1wbTh4
eHguYyAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvbWZkL3NtNTAxLmMgICAgICAgICAgICAg
ICB8IDYgKystLS0tCiBkcml2ZXJzL21mZC9zdG0zMi10aW1lcnMuYyAgICAgICAgfCA2ICsrLS0t
LQogZHJpdmVycy9tZmQvdGlfYW0zMzV4X3RzY2FkYy5jICAgIHwgNiArKy0tLS0KIGRyaXZlcnMv
bWZkL3RwczY1OTExLWNvbXBhcmF0b3IuYyB8IDYgKystLS0tCiBkcml2ZXJzL21mZC90d2w0MDMw
LWF1ZGlvLmMgICAgICAgfCA2ICsrLS0tLQogMTggZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9u
cygrKSwgNjggZGVsZXRpb25zKC0pCgpiYXNlLWNvbW1pdDogNGU4NzE0OGY4MGQxOThiYTVmZWJj
YmNjOTY5YzZiOTQ3MTA5OWEwOQotLSAKMi40Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
