Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F30FD63D948
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Nov 2022 16:23:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1573C6507B;
	Wed, 30 Nov 2022 15:23:03 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5D26C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Nov 2022 15:23:02 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p0OuS-00009r-WF; Wed, 30 Nov 2022 16:22:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p0OuI-001LdM-Fl; Wed, 30 Nov 2022 16:21:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p0OuI-001VqY-Bk; Wed, 30 Nov 2022 16:21:54 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Wed, 30 Nov 2022 16:21:37 +0100
Message-Id: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4201;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=OJndCEVt3aO3P0WDGIcSb4svVqFYr4L7BRkc05e7KK8=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjh3TeeKE42zO/dADA8GIRueUo9ayiBLrzlu5BRvEE
 w4nESiyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY4d03gAKCRDB/BR4rcrsCSMiB/
 9P92eEh5i/ykm3IhBfm7shzbMkb/wG7nDkc+vvv70Z73UbyxFvKLzsJ+xK5VXqTCLlo8DUkfo9BJPh
 gr8T1RvP6HUtOELqCuQE6ruqv9wlN28AYIytMCoO+QvOqLdbM84LW89W1fK1B6ImECmggYrGw60CXE
 f7Rv+b9z4cETy+dLsOSVyQ0zsix7/7HyoqlinRbwr3R1SJewjSjU++PJ6H8LCe6DcYMwdJkpBaC2Ol
 hVLwWlo1eF82Cow8M5bd0+XSEZXpG5oFaf6CebgL+JYlfUHRWLzOpJpq6RAXCmfilUqisk0cROhhop
 q2OYuXh1amqkiMJYz8hRni9/YulIOt
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
 Guenter Roeck <groeck@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-riscv@lists.infradead.org,
 linux-leds@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 chrome-platform@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Michal Simek <michal.simek@xilinx.com>,
 linux-stm32@st-md-mailman.stormreply.com, Hammer Hsieh <hammerh0314@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Steven Rostedt <rostedt@goodmis.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Michael Walle <michael@walle.cc>,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [Linux-stm32] [PATCH v2 00/11] pwm: Allow .get_state to fail
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

SGVsbG8sCgpJIGZvcmdvdCBhYm91dCB0aGlzIHNlcmllcyBhbmQgd2FzIHJlbWVtYmVyZWQgd2hl
biBJIHRhbGtlZCB0byBDb25vcgpEb29sZXkgYWJvdXQgaG93IC5nZXRfc3RhdGUoKSBzaG91bGQg
YmVoYXZlIGluIGFuIGVycm9yIGNhc2UuCgpDb21wYXJlZCB0byAoaW1wbGljaXQpIHYxLCBzZW50
IHdpdGggTWVzc2FnZS1JZDogMjAyMjA5MTYxNTE1MDYuMjk4NDg4LTEtdS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlCkkgY2hhbmdlZDoKCiAtIFBhdGNoICMxIHdoaWNoIGRvZXMgdGhlIHBy
b3RvdHlwZSBjaGFuZ2Ugbm93IGp1c3QgYWRkcyAicmV0dXJuIDAiIHRvCiAgIGFsbCBpbXBsZW1l
bnRhdGlvbnMgYW5kIHNvIGdldHMgc2ltcGxlciBhbmQgZG9lc24ndCBjaGFuZ2UgYmVoYXZpb3Vy
LgogICBUaGUgYWRhcHRpb25zIHRvIHRoZSBkaWZmZXJlbnQgLmdldF9zdGF0ZSgpIGltcGxlbWVu
dGF0aW9ucyBhcmUgc3BsaXQKICAgb3V0IGludG8gaW5kaXZpZHVhbCBwYXRjaGVzIHRvIGVhc2Ug
cmV2aWV3LgogLSBPbmUgbWlub3IgaW5jb25zaXN0ZW5jeSBmaXhlZCBpbiAicHdtOiBIYW5kbGUg
LmdldF9zdGF0ZSgpIGZhaWx1cmVzIgogICB0aGF0IEkgbm90aWNlZCB3aGlsZSBsb29raW5nIGlu
dG8gdGhpcyBwYXRjaC4KIC0gSSBza2lwcGVkIGNoYW5naW5nIHN1bjRpLmMgYXMgSSBkb24ndCBr
bm93IGhvdyB0byBoYW5kbGUgdGhlIGVycm9yCiAgIHRoZXJlLiBTb21lb25lIG1pZ2h0IHdhbnQg
dG8gaGF2ZSBhIGxvb2suIChUaGF0J3Mgbm90IGlkZWFsLCBidXQgaXQncwogICBub3Qgd29yc2Ug
dGhhbiB0aGUgc2FtZSBpc3N1ZSBiZWZvcmUgdGhpcyBzZXJpZXMuKQoKSW4gdjEgVGhpZXJyeSBo
YWQgdGhlIGNvbmNlcm46Cgp8IFRoYXQgcmFpc2VzIHRoZSBxdWVzdGlvbiBhYm91dCB3aGF0IHRv
IGRvIGluIHRoZXNlIGNhc2VzLiBJZiB3ZSByZXR1cm4KfCBhbiBlcnJvciwgdGhhdCBjb3VsZCBw
b3RlbnRpYWxseSB0aHJvdyBvZmYgY29uc3VtZXJzLiBTbyBwZXJoYXBzIHRoZQp8IGNsb3Nlc3Qg
d291bGQgYmUgdG8gcmV0dXJuIGEgZGlzYWJsZWQgUFdNPyBPciBwZXJoYXBzIGl0J2QgYmUgdXAg
dG8gdGhlCnwgY29uc3VtZXIgdG8gcHJvdmlkZSBzb21lIGZhbGxiYWNrIGNvbmZpZ3VyYXRpb24g
Zm9yIGludmFsaWRseSBjb25maWd1cmVkCnwgb3IgdW5jb25maWd1cmVkIFBXTXMuCgouZ2V0X3N0
YXRlKCkgaXMgb25seSBjYWxsZWQgaW4gcHdtX2RldmljZV9yZXF1ZXN0IG9uIGEgcHdtX3N0YXRl
IHRoYXQgYQpjb25zdW1lciBtaWdodCBzZWUuIEJlZm9yZSBteSBzZXJpZXMgYSBjb25zdW1lciBt
aWdodCBoYXZlIHNlZW4gYQpwYXJ0aWFsIG1vZGlmaWVkIHB3bV9zdGF0ZSAoYmVjYXVzZSAuZ2V0
X3N0YXRlKCkgbWlnaHQgaGF2ZSBtb2RpZmllZAoucGVyaW9kLCB0aGVuIHN0dW1ibGVkIGFuZCBy
ZXR1cm5lZCBzaWxlbnRseSkuIFRoZSBsYXN0IHBhdGNoIGVuc3VyZXMKdGhhdCB0aGlzIHBhcnRp
YWwgbW9kaWZpY2F0aW9uIGlzbid0IGdpdmVuIG91dCB0byB0aGUgY29uc3VtZXIuIEluc3RlYWQK
dGhleSBub3cgc2VlIHRoZSBzYW1lIGFzIGlmIC5nZXRfc3RhdGUgd2Fzbid0IGltcGxlbWVudGVk
IGF0IGFsbC4KCkJlc3QgcmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnICgxMSk6CiAgcHdt
OiBNYWtlIC5nZXRfc3RhdGUoKSBjYWxsYmFjayByZXR1cm4gYW4gZXJyb3IgY29kZQogIHB3bS90
cmFjaW5nOiBBbHNvIHJlY29yZCB0cmFjZSBldmVudHMgZm9yIGZhaWxlZCBBUEkgY2FsbHMKICBk
cm0vYnJpZGdlOiB0aS1zbjY1ZHNpODY6IFByb3BhZ2F0ZSBlcnJvcnMgaW4gLmdldF9zdGF0ZSgp
IHRvIHRoZQogICAgY2FsbGVyCiAgbGVkczogcWNvbS1scGc6IFByb3BhZ2F0ZSBlcnJvcnMgaW4g
LmdldF9zdGF0ZSgpIHRvIHRoZSBjYWxsZXIKICBwd206IGNyYzogUHJvcGFnYXRlIGVycm9ycyBp
biAuZ2V0X3N0YXRlKCkgdG8gdGhlIGNhbGxlcgogIHB3bTogY3Jvcy1lYzogUHJvcGFnYXRlIGVy
cm9ycyBpbiAuZ2V0X3N0YXRlKCkgdG8gdGhlIGNhbGxlcgogIHB3bTogaW14Mjc6IFByb3BhZ2F0
ZSBlcnJvcnMgaW4gLmdldF9zdGF0ZSgpIHRvIHRoZSBjYWxsZXIKICBwd206IG10ay1kaXNwOiBQ
cm9wYWdhdGUgZXJyb3JzIGluIC5nZXRfc3RhdGUoKSB0byB0aGUgY2FsbGVyCiAgcHdtOiByb2Nr
Y2hpcDogUHJvcGFnYXRlIGVycm9ycyBpbiAuZ2V0X3N0YXRlKCkgdG8gdGhlIGNhbGxlcgogIHB3
bTogc3ByZDogUHJvcGFnYXRlIGVycm9ycyBpbiAuZ2V0X3N0YXRlKCkgdG8gdGhlIGNhbGxlcgog
IHB3bTogSGFuZGxlIC5nZXRfc3RhdGUoKSBmYWlsdXJlcwoKIGRyaXZlcnMvZ3Bpby9ncGlvLW12
ZWJ1LmMgICAgICAgICAgICAgfCAgOSArKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGktc242NWRzaTg2LmMgfCAxNCArKysrKysrKy0tLS0tLQogZHJpdmVycy9sZWRzL3JnYi9sZWRz
LXFjb20tbHBnLmMgICAgICB8IDE0ICsrKysrKysrLS0tLS0tCiBkcml2ZXJzL3B3bS9jb3JlLmMg
ICAgICAgICAgICAgICAgICAgIHwgMjggKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiBkcml2
ZXJzL3B3bS9wd20tYXRtZWwuYyAgICAgICAgICAgICAgIHwgIDYgKysrKy0tCiBkcml2ZXJzL3B3
bS9wd20tYmNtLWlwcm9jLmMgICAgICAgICAgIHwgIDggKysrKystLS0KIGRyaXZlcnMvcHdtL3B3
bS1jcmMuYyAgICAgICAgICAgICAgICAgfCAxMCArKysrKystLS0tCiBkcml2ZXJzL3B3bS9wd20t
Y3Jvcy1lYy5jICAgICAgICAgICAgIHwgIDggKysrKystLS0KIGRyaXZlcnMvcHdtL3B3bS1kd2Mu
YyAgICAgICAgICAgICAgICAgfCAgNiArKysrLS0KIGRyaXZlcnMvcHdtL3B3bS1oaWJ2dC5jICAg
ICAgICAgICAgICAgfCAgNiArKysrLS0KIGRyaXZlcnMvcHdtL3B3bS1pbXgtdHBtLmMgICAgICAg
ICAgICAgfCAgOCArKysrKy0tLQogZHJpdmVycy9wd20vcHdtLWlteDI3LmMgICAgICAgICAgICAg
ICB8ICA4ICsrKysrLS0tCiBkcml2ZXJzL3B3bS9wd20taW50ZWwtbGdtLmMgICAgICAgICAgIHwg
IDYgKysrKy0tCiBkcml2ZXJzL3B3bS9wd20taXFzNjIwYS5jICAgICAgICAgICAgIHwgIDYgKysr
Ky0tCiBkcml2ZXJzL3B3bS9wd20ta2VlbWJheS5jICAgICAgICAgICAgIHwgIDYgKysrKy0tCiBk
cml2ZXJzL3B3bS9wd20tbHBzcy5jICAgICAgICAgICAgICAgIHwgIDYgKysrKy0tCiBkcml2ZXJz
L3B3bS9wd20tbWVzb24uYyAgICAgICAgICAgICAgIHwgIDggKysrKystLS0KIGRyaXZlcnMvcHdt
L3B3bS1tdGstZGlzcC5jICAgICAgICAgICAgfCAxMiArKysrKysrLS0tLS0KIGRyaXZlcnMvcHdt
L3B3bS1wY2E5Njg1LmMgICAgICAgICAgICAgfCAgOCArKysrKy0tLQogZHJpdmVycy9wd20vcHdt
LXJhc3BiZXJyeXBpLXBvZS5jICAgICB8ICA4ICsrKysrLS0tCiBkcml2ZXJzL3B3bS9wd20tcm9j
a2NoaXAuYyAgICAgICAgICAgIHwgMTIgKysrKysrKy0tLS0tCiBkcml2ZXJzL3B3bS9wd20tc2lm
aXZlLmMgICAgICAgICAgICAgIHwgIDYgKysrKy0tCiBkcml2ZXJzL3B3bS9wd20tc2wyOGNwbGQu
YyAgICAgICAgICAgIHwgIDggKysrKystLS0KIGRyaXZlcnMvcHdtL3B3bS1zcHJkLmMgICAgICAg
ICAgICAgICAgfCAgOCArKysrKy0tLQogZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMgICAgICAg
ICAgICB8ICA4ICsrKysrLS0tCiBkcml2ZXJzL3B3bS9wd20tc3VuNGkuYyAgICAgICAgICAgICAg
IHwgMTIgKysrKysrKy0tLS0tCiBkcml2ZXJzL3B3bS9wd20tc3VucGx1cy5jICAgICAgICAgICAg
IHwgIDYgKysrKy0tCiBkcml2ZXJzL3B3bS9wd20tdmlzY29udGkuYyAgICAgICAgICAgIHwgIDYg
KysrKy0tCiBkcml2ZXJzL3B3bS9wd20teGlsaW54LmMgICAgICAgICAgICAgIHwgIDggKysrKyst
LS0KIGluY2x1ZGUvbGludXgvcHdtLmggICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCiBpbmNs
dWRlL3RyYWNlL2V2ZW50cy9wd20uaCAgICAgICAgICAgIHwgMjAgKysrKysrKysrLS0tLS0tLS0t
LQogMzEgZmlsZXMgY2hhbmdlZCwgMTc0IGluc2VydGlvbnMoKyksIDEwOSBkZWxldGlvbnMoLSkK
CgpiYXNlLWNvbW1pdDogNTAzMTU5NDVkMTc4ZWViZWM0ZThlMmM1MGMyNjU3NjdkZGI5MjZlYgot
LSAKMi4zOC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
