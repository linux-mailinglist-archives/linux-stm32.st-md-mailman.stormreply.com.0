Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 751E26A9FC0
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Mar 2023 19:55:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3904BC6A619;
	Fri,  3 Mar 2023 18:55:33 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86921C6A616
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Mar 2023 18:55:31 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYAYY-0006AS-EQ; Fri, 03 Mar 2023 19:55:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYAYT-001cTO-L9; Fri, 03 Mar 2023 19:54:57 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pYAYS-001ujd-Vg; Fri, 03 Mar 2023 19:54:56 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Benson Leung <bleung@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sean Anderson <sean.anderson@seco.com>,
 Michal Simek <michal.simek@xilinx.com>
Date: Fri,  3 Mar 2023 19:54:15 +0100
Message-Id: <20230303185445.2112695-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4518;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=0T84eVJj5zms3XJcCemeo6tbGagiWg7FsqOn9O28VD8=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkAkHgL+hOWzMEGr3pJ+k7l131cW/u0VRGYd/bj
 C6SJ3/IMe2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAJB4AAKCRDB/BR4rcrs
 CaChB/9690Y0j69SwC7ah25tZA8zQepQ8HC5QoKJRtoGAE18zwPCd9i6Ah2GskRAHqpYY0uNm04
 Ofb+Baq5kb52LxrrBMQmedZl3aJYZWofch+1g4d/hEf9ipUk1cY0J534mp4cGBxRfPQgNmj16IF
 Tz/dORDGUT6OLi4ZeGBhKRuh6aZBIqkrcvRyINJxJlgmQA0q2BGM2qwLZ5OSrCnu3bmCMIkxRWw
 2x28v+TFl6h7Cz/hIoA/Z/10PnlupKviCktbI5hdQj824S0rA4YCq307ujpcdKH73fHV5YQNuKp
 y+q2ulHmEZ8gwbJaQYr3UGERAiuKSo1A/FmH1rTX55+FSi4U
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 chrome-platform@lists.linux.dev, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-rpi-kernel@lists.infradead.org, kernel@pengutronix.de,
 Guenter Roeck <groeck@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Subject: [Linux-stm32] [PATCH 00/30] pwm: Convert to platform remove
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

SGVsbG8sCgp0aGlzIHBhdGNoIHNlcmllcyBhZGFwdHMgdGhlIHBsYXRmb3JtIGRyaXZlcnMgYmVs
b3cgZHJpdmVycy9wd20gdG8gdXNlCnRoZSAucmVtb3ZlX25ldygpIGNhbGxiYWNrLiBDb21wYXJl
ZCB0byB0aGUgdHJhZGl0aW9uYWwgLnJlbW92ZSgpCmNhbGxiYWNrIC5yZW1vdmVfbmV3KCkgcmV0
dXJucyBubyB2YWx1ZS4gVGhpcyBpcyBhIGdvb2QgdGhpbmcgYmVjYXVzZQp0aGUgZHJpdmVyIGNv
cmUgZG9lc24ndCAoYW5kIGNhbm5vdCkgY29wZSBmb3IgZXJyb3JzIGR1cmluZyByZW1vdmUuIFRo
ZQpvbmx5IGVmZmVjdCBvZiBhIG5vbi16ZXJvIHJldHVybiB2YWx1ZSBpbiAucmVtb3ZlKCkgaXMg
dGhhdCB0aGUgZHJpdmVyCmNvcmUgZW1pdHMgYSB3YXJuaW5nLiBUaGUgZGV2aWNlIGlzIHJlbW92
ZWQgYW55aG93IGFuZCBhbiBlYXJseSByZXR1cm4KZnJvbSAucmVtb3ZlKCkgdXN1YWxseSB5aWVs
ZHMgYSByZXNvdXJjZSBsZWFrLgoKQnkgY2hhbmdpbmcgdGhlIHJlbW92ZSBjYWxsYmFjayB0byBy
ZXR1cm4gdm9pZCBkcml2ZXIgYXV0aG9ycyBjYW5ub3QKcmVhc29uYWJseSBhc3N1bWUgYW55IG1v
cmUgdGhhdCB0aGVyZSBpcyBzb21lIGtpbmQgb2YgY2xlYW51cCBsYXRlci4KCkFsbCBkcml2ZXJz
IHRvdWNoZWQgaGVyZSByZXR1cm5lZCB6ZXJvIHVuY29uZGl0aW9uYWxseSBpbiB0aGVpciByZW1v
dmUKY2FsbGJhY2ssIHNvIHRoZXkgY291bGQgYWxsIGJlIGNvbnZlcnRlZCB0cml2aWFsbHkgdG8g
LnJlbW92ZV9uZXcoKS4KCk5vdGUgdGhhdCB0aGlzIHNlcmllcyBkZXBlbmRzIG9uIGNvbW1pdCA1
YzVhNzY4MGU2N2IgKCJwbGF0Zm9ybTogUHJvdmlkZQphIHJlbW92ZSBjYWxsYmFjayB0aGF0IHJl
dHVybnMgbm8gdmFsdWUiKSB0aGF0IGlzIGFscmVhZHkgaW4gTGludXMnIHRyZWUKYnV0IG5vdCB5
ZXQgaW5jbHVkZWQgaW4gYSB0YWdnZWQgdmVyc2lvbi4KCkJlc3QgcmVnYXJkcwpVd2UKClV3ZSBL
bGVpbmUtS8O2bmlnICgzMCk6CiAgcHdtOiBhdG1lbC1obGNkYzogQ29udmVydCB0byBwbGF0Zm9y
bSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBwd206IGF0bWVsLXRjYjogQ29udmVy
dCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBwd206IGF0bWVs
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHB3
bTogYmNtLWlwcm9jOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5p
bmcgdm9pZAogIHB3bTogYmNtMjgzNTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQKICBwd206IGJlcmxpbjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBwd206IGJyY21zdGI6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcHdtOiBjbGs6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcHdtOiBjcm9zLWVj
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHB3
bTogaGlidnQ6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2
b2lkCiAgcHdtOiBpbWc6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZyB2b2lkCiAgcHdtOiBpbXgtdHBtOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxs
YmFjayByZXR1cm5pbmcgdm9pZAogIHB3bTogbHBjMTh4eC1zY3Q6IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcHdtOiBscHNzLXBsYXRmb3JtOiBD
b252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHB3bTog
bXRrLWRpc3A6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2
b2lkCiAgcHdtOiBvbWFwLWRtdGltZXI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkCiAgcHdtOiByY2FyOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHB3bTogcm9ja2NoaXA6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcHdtOiBzYW1zdW5nOiBDb252
ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHB3bTogc2lm
aXZlOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAog
IHB3bTogc3BlYXI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
ZyB2b2lkCiAgcHdtOiBzcHJkOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayBy
ZXR1cm5pbmcgdm9pZAogIHB3bTogc3RpOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxs
YmFjayByZXR1cm5pbmcgdm9pZAogIHB3bTogc3RtMzI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgcHdtOiBzdW40aTogQ29udmVydCB0byBwbGF0
Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBwd206IHRlZ3JhOiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHB3bTogdGllY2Fw
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHB3
bTogdGllaHJwd206IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmlu
ZyB2b2lkCiAgcHdtOiB2dDg1MDA6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkCiAgcHdtOiB4aWxpbng6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZyB2b2lkCgogZHJpdmVycy9wd20vcHdtLWF0bWVsLWhsY2RjLmMg
ICB8IDYgKystLS0tCiBkcml2ZXJzL3B3bS9wd20tYXRtZWwtdGNiLmMgICAgIHwgNiArKy0tLS0K
IGRyaXZlcnMvcHdtL3B3bS1hdG1lbC5jICAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9wd20v
cHdtLWJjbS1pcHJvYy5jICAgICB8IDYgKystLS0tCiBkcml2ZXJzL3B3bS9wd20tYmNtMjgzNS5j
ICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvcHdtL3B3bS1iZXJsaW4uYyAgICAgICAgfCA2ICsr
LS0tLQogZHJpdmVycy9wd20vcHdtLWJyY21zdGIuYyAgICAgICB8IDYgKystLS0tCiBkcml2ZXJz
L3B3bS9wd20tY2xrLmMgICAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvcHdtL3B3bS1jcm9z
LWVjLmMgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9wd20vcHdtLWhpYnZ0LmMgICAgICAgICB8
IDYgKystLS0tCiBkcml2ZXJzL3B3bS9wd20taW1nLmMgICAgICAgICAgIHwgNiArKy0tLS0KIGRy
aXZlcnMvcHdtL3B3bS1pbXgtdHBtLmMgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9wd20vcHdt
LWxwYzE4eHgtc2N0LmMgICB8IDYgKystLS0tCiBkcml2ZXJzL3B3bS9wd20tbHBzcy1wbGF0Zm9y
bS5jIHwgNSArKy0tLQogZHJpdmVycy9wd20vcHdtLW10ay1kaXNwLmMgICAgICB8IDYgKystLS0t
CiBkcml2ZXJzL3B3bS9wd20tb21hcC1kbXRpbWVyLmMgIHwgNiArKy0tLS0KIGRyaXZlcnMvcHdt
L3B3bS1yY2FyLmMgICAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9wd20vcHdtLXJvY2tjaGlw
LmMgICAgICB8IDYgKystLS0tCiBkcml2ZXJzL3B3bS9wd20tc2Ftc3VuZy5jICAgICAgIHwgNiAr
Ky0tLS0KIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVy
cy9wd20vcHdtLXNwZWFyLmMgICAgICAgICB8IDYgKystLS0tCiBkcml2ZXJzL3B3bS9wd20tc3By
ZC5jICAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvcHdtL3B3bS1zdGkuYyAgICAgICAgICAg
fCA2ICsrLS0tLQogZHJpdmVycy9wd20vcHdtLXN0bTMyLmMgICAgICAgICB8IDYgKystLS0tCiBk
cml2ZXJzL3B3bS9wd20tc3VuNGkuYyAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvcHdtL3B3
bS10ZWdyYS5jICAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9wd20vcHdtLXRpZWNhcC5jICAg
ICAgICB8IDYgKystLS0tCiBkcml2ZXJzL3B3bS9wd20tdGllaHJwd20uYyAgICAgIHwgNiArKy0t
LS0KIGRyaXZlcnMvcHdtL3B3bS12dDg1MDAuYyAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9w
d20vcHdtLXhpbGlueC5jICAgICAgICB8IDUgKystLS0KIDMwIGZpbGVzIGNoYW5nZWQsIDYwIGlu
c2VydGlvbnMoKyksIDExOCBkZWxldGlvbnMoLSkKCmJhc2UtY29tbWl0OiAyZWIyOWQ1OWRkZjAy
ZTM5Nzc0YWJmYjYwYjIwMzBiMGI3ZTI3YzFmCi0tIAoyLjM5LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
