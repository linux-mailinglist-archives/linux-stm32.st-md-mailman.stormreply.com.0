Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2677E2AD6
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 18:18:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1185AC6B460;
	Mon,  6 Nov 2023 17:18:14 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 816E3C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Nov 2023 17:18:12 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r03EV-0005QQ-75; Mon, 06 Nov 2023 18:17:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r03ER-0075yD-9N; Mon, 06 Nov 2023 18:17:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r03EQ-00DrIi-VZ; Mon, 06 Nov 2023 18:17:46 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lee Jones <lee@kernel.org>
Date: Mon,  6 Nov 2023 18:17:09 +0100
Message-ID: <20231106171708.3892347-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3116;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=0FF0Hir69E2HKsvJfQNY/ddJ62LkMYTY7VB8GGwosMM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlSR+UEVz6EdKPvoEWe/b9VJEfQp/9GrduLgHED
 EGfX/1hsAWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZUkflAAKCRCPgPtYfRL+
 TrkgCACt6jktG815FM78opuMSJzVh8L8EMrXJg2QcTB4PFmiFdLTrdybne7rIjMRxTpAjmsba0v
 VL8Ob6Kz8AmNLdjbx3qjHYArjUhG2hGyldjimtJxv5vEEpdcpJbJnl2Tj3vdtAWxfk4DE0K3xcl
 TTIh0MSMGJsPKQiE/fuKjG8fzS3mk8bORQEu+5KMYAVZLQdUsoZcmUULLWFdnOvaqFxrGackoTM
 51EtiqsmxEKubEHJa0r+WpKi3bNHl/nRXTPU4MNCLO2JCXXY3cRSJ24qriAGi/+BvbLWiNrdVRN
 adO9ADuSwQuYtHKSkBXthB6PplIwkbPbXVaxwNvTbbhwprJY
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
 kernel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-omap@vger.kernel.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: [Linux-stm32] [PATCH 00/18] mfd: Convert to platform remove
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
CkJlc3QgcmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnICgxOCk6CiAgbWZkOiBhYjg1MDAt
c3lzY3RybDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAg
ICB2b2lkCiAgbWZkOiBjcm9zX2VjX2RldjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtZmQ6IGV4eW5vcy1scGFzczogQ29udmVydCB0byBwbGF0
Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtZmQ6IGZzbC1pbXgyNS10c2Fk
YzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAgICB2b2lk
CiAgbWZkOiBoaTY1NXgtcG1pYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sg
cmV0dXJuaW5nIHZvaWQKICBtZmQ6IGludGVsLWxwc3MtYWNwaTogQ29udmVydCB0byBwbGF0Zm9y
bSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nCiAgICB2b2lkCiAgbWZkOiBrZW1wbGQtY29yZTog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtZmQ6
IG1jcC1zYTExeDA6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
ZyB2b2lkCiAgbWZkOiBteHMtbHJhZGM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkCiAgbWZkOiBvbWFwLXVzYi1ob3N0OiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIG1mZDogb21hcC11c2ItdGxsOiBD
b252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIG1mZDog
cGNmNTA2MzMtYWRjOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5p
bmcgdm9pZAogIG1mZDogcWNvbS1wbTh4eHg6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNh
bGxiYWNrIHJldHVybmluZyB2b2lkCiAgbWZkOiBzbTUwMTogQ29udmVydCB0byBwbGF0Zm9ybSBy
ZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtZmQ6IHN0bTMyLXRpbWVyczogQ29udmVy
dCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBtZmQ6IHRpX2Ft
MzM1eF90c2NhZGM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
ZwogICAgdm9pZAogIG1mZDogdHBzNjU5MTEtY29tcGFyYXRvcjogQ29udmVydCB0byBwbGF0Zm9y
bSByZW1vdmUgY2FsbGJhY2sKICAgIHJldHVybmluZyB2b2lkCiAgbWZkOiB0d2w0MDMwLWF1ZGlv
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAoKIGRy
aXZlcnMvbWZkL2FiODUwMC1zeXNjdHJsLmMgICAgICB8IDYgKystLS0tCiBkcml2ZXJzL21mZC9j
cm9zX2VjX2Rldi5jICAgICAgICAgfCA1ICsrLS0tCiBkcml2ZXJzL21mZC9leHlub3MtbHBhc3Mu
YyAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9tZmQvZnNsLWlteDI1LXRzYWRjLmMgICAgIHwg
NiArKy0tLS0KIGRyaXZlcnMvbWZkL2hpNjU1eC1wbWljLmMgICAgICAgICB8IDUgKystLS0KIGRy
aXZlcnMvbWZkL2ludGVsLWxwc3MtYWNwaS5jICAgICB8IDYgKystLS0tCiBkcml2ZXJzL21mZC9r
ZW1wbGQtY29yZS5jICAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9tZmQvbWNwLXNhMTF4MC5j
ICAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvbWZkL214cy1scmFkYy5jICAgICAgICAgICB8
IDYgKystLS0tCiBkcml2ZXJzL21mZC9vbWFwLXVzYi1ob3N0LmMgICAgICAgfCA1ICsrLS0tCiBk
cml2ZXJzL21mZC9vbWFwLXVzYi10bGwuYyAgICAgICAgfCA1ICsrLS0tCiBkcml2ZXJzL21mZC9w
Y2Y1MDYzMy1hZGMuYyAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9tZmQvcWNvbS1wbTh4eHgu
YyAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvbWZkL3NtNTAxLmMgICAgICAgICAgICAgICB8
IDYgKystLS0tCiBkcml2ZXJzL21mZC9zdG0zMi10aW1lcnMuYyAgICAgICAgfCA2ICsrLS0tLQog
ZHJpdmVycy9tZmQvdGlfYW0zMzV4X3RzY2FkYy5jICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvbWZk
L3RwczY1OTExLWNvbXBhcmF0b3IuYyB8IDYgKystLS0tCiBkcml2ZXJzL21mZC90d2w0MDMwLWF1
ZGlvLmMgICAgICAgfCA2ICsrLS0tLQogMTggZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygr
KSwgNjggZGVsZXRpb25zKC0pCgpiYXNlLWNvbW1pdDogM2ZmN2E1NzgxY2VlZTNiZWZiOTIyNGQy
OWNlZjZlNmE0NzY2YzVmZQotLSAKMi40Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
