Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7B06B7077
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 08:54:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CCC2C6B443;
	Mon, 13 Mar 2023 07:54:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C0DCC6B440
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 07:54:45 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbd0x-0001j6-AO; Mon, 13 Mar 2023 08:54:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbd0v-003naX-CF; Mon, 13 Mar 2023 08:54:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pbd0u-004TOX-OE; Mon, 13 Mar 2023 08:54:36 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Date: Mon, 13 Mar 2023 08:54:25 +0100
Message-Id: <20230313075430.2730803-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=yo4yph09zji6jUBdgrKcMoe7RCLM6ePyFNEQRE1Mono=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkDtajP8HGpAMePs0ZnmVVLrhvd2sv+Tnd0xIxZ
 h0sy6J4bKqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZA7WowAKCRDB/BR4rcrs
 CQpTB/0fklJTJiJcfqJgvfdMQaem2ZxZR/Gmruv90hj1UT6nMcstF5G68Btu/eTP7TWwYq4sQUs
 RhljjMAO/qioqNZL3bO8aZDgzlb8NOg22O3ggXg9+AkMkbm4fWlRWbGHlX/E3vCL/YsMugy2ffl
 lxg69QN0jZOfEu09mORB9tvbXwbeKHR4H/yvgpowCtiE6JqUF7otxDaQh7A6c4UOyblpQvdCjci
 WuP6O2hg9hRQjUn/qy4UObfEXeTYzdC1/sGxz9dXHeJU/o2WFu02wv/ggy/vN8ae+zAp6tJ2DNy
 mTQdLEGJjf23EV9BCefhUQkalSThsZgl3qSWStQbsGdGslP3
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-tegra@vger.kernel.org, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 0/5] clocksource: Convert to platform remove
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
b3cgZHJpdmVycy9jbGsKdG8gdXNlIHRoZSAucmVtb3ZlX25ldygpIGNhbGxiYWNrLiBDb21wYXJl
ZCB0byB0aGUgdHJhZGl0aW9uYWwgLnJlbW92ZSgpCmNhbGxiYWNrIC5yZW1vdmVfbmV3KCkgcmV0
dXJucyBubyB2YWx1ZS4gVGhpcyBpcyBhIGdvb2QgdGhpbmcgYmVjYXVzZQp0aGUgZHJpdmVyIGNv
cmUgZG9lc24ndCAoYW5kIGNhbm5vdCkgY29wZSBmb3IgZXJyb3JzIGR1cmluZyByZW1vdmUuIFRo
ZQpvbmx5IGVmZmVjdCBvZiBhIG5vbi16ZXJvIHJldHVybiB2YWx1ZSBpbiAucmVtb3ZlKCkgaXMg
dGhhdCB0aGUgZHJpdmVyCmNvcmUgZW1pdHMgYSB3YXJuaW5nLiBUaGUgZGV2aWNlIGlzIHJlbW92
ZWQgYW55aG93IGFuZCBhbiBlYXJseSByZXR1cm4KZnJvbSAucmVtb3ZlKCkgdXN1YWxseSB5aWVs
ZHMgYSByZXNvdXJjZSBsZWFrLgoKTW9zdCBjbG9ja3NvdXJjZSBkcml2ZXJzIGFyZSBub3Qgc3Vw
cG9zZWQgdG8gYmUgcmVtb3ZlZC4gVHdvIGRyaXZlcnMgYXJlCmFkYXB0ZWQgaGVyZSB0byBhY3R1
YWxseSBwcmV2ZW50IHJlbW92YWwuIE9uZSBkcml2ZXIgaXMgZml4ZWQgbm90IHRvCnJldHVybiBh
biBlcnJvciBjb2RlIGluIC5yZW1vdmUoKSBhbmQgdGhlbiB0aGUgdHdvIHJlbWFpbmluZyBkcml2
ZXJzCndpdGggYSByZW1vdmUgY2FsbGJhY2sgYXJlIHRyaXZpYWxseSBjb252ZXJ0ZWQgdG8gLnJl
bW92ZV9uZXcoKS4KCkJlc3QgcmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnICg1KToKICBj
bG9ja3NvdXJjZTogc2hfbXR1MjogTWFyayBkcml2ZXIgYXMgbm9uLXJlbW92YWJsZQogIGNsb2Nr
c291cmNlOiB0aW1lci1zdG0zMi1scDogTWFyayBkcml2ZXIgYXMgbm9uLXJlbW92YWJsZQogIGNs
b2Nrc291cmNlOiB0aW1lci10aS1kbTogSW1wcm92ZSBlcnJvciBtZXNzYWdlIGluIC5yZW1vdmUK
ICBjbG9ja3NvdXJjZTogdGltZXItdGVncmExODY6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrCiAgICByZXR1cm5pbmcgdm9pZAogIGNsb2Nrc291cmNlOiB0aW1lci10aS1kbTog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sKICAgIHJldHVybmluZyB2b2lkCgog
ZHJpdmVycy9jbG9ja3NvdXJjZS9zaF9tdHUyLmMgICAgICAgIHwgNyArLS0tLS0tCiBkcml2ZXJz
L2Nsb2Nrc291cmNlL3RpbWVyLXN0bTMyLWxwLmMgfCA3ICstLS0tLS0KIGRyaXZlcnMvY2xvY2tz
b3VyY2UvdGltZXItdGVncmExODYuYyB8IDYgKystLS0tCiBkcml2ZXJzL2Nsb2Nrc291cmNlL3Rp
bWVyLXRpLWRtLmMgICAgfCA3ICsrKystLS0KIDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAxOSBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDogZmUxNWMyNmVlMjZlZmExMTc0MWE3
YjYzMmU5ZjIzYjAxYWNhNGNjNgotLSAKMi4zOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
