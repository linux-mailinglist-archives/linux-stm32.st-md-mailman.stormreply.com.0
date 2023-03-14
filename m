Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FB06B8E8B
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 10:23:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA3FAC65E60;
	Tue, 14 Mar 2023 09:23:13 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88525C64107
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 09:23:11 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1pc0ri-0004VU-7h; Tue, 14 Mar 2023 10:22:42 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1pc0rc-0042uO-J6; Tue, 14 Mar 2023 10:22:36 +0100
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1pc0rb-0002Dp-TC; Tue, 14 Mar 2023 10:22:35 +0100
Message-ID: <bbd54405501ec660ac941971e2203855fd79a90f.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, 
 Arnd Bergmann <arnd@arndb.de>, Inki Dae <inki.dae@samsung.com>, Seung-Woo
 Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Tomi
 Valkeinen <tomba@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,  Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 14 Mar 2023 10:22:35 +0100
In-Reply-To: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
References: <20221209220555.3631364-1-u.kleine-koenig@pengutronix.de>
User-Agent: Evolution 3.38.3-1+deb11u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-samsung-soc@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm: Drop ARCH_MULTIPLATFORM from
	dependencies
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

T24gRnIsIDIwMjItMTItMDkgYXQgMjM6MDUgKzAxMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3Rl
Ogo+IFNvbWUgb2YgdGhlc2UgZGVwZW5kZW5jaWVzIHVzZWQgdG8gYmUgc2Vuc2libGUgd2hlbiBv
bmx5IGEgc21hbGwgcGFydCBvZgo+IHRoZSBwbGF0Zm9ybXMgc3VwcG9ydGVkIGJ5IEFSQ0g9YXJt
IGNvdWxkIGJlIGNvbXBpbGVkIHRvZ2V0aGVyIGluIGEKPiBzaW5nbGUga2VybmVsIGltYWdlLiBO
b3dhZGF5cyBBUkNIX01VTFRJUExBVEZPUk0gaXMgb25seSB1c2VkIGFzIGEgZ3VhcmQKPiBmb3Ig
a2VybmVsIG9wdGlvbnMgaW5jb21wYXRpYmxlIHdpdGggYSBtdWx0aXBsYXRmb3JtIGltYWdlLiBT
ZWUgY29tbWl0Cj4gODRmYzg2MzYwNjIzICgiQVJNOiBtYWtlIEFSQ0hfTVVMVElQTEFURk9STSB1
c2VyLXZpc2libGUiKSBmb3Igc29tZSBtb3JlCj4gZGV0YWlscy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0t
LQo+IMKgZHJpdmVycy9ncHUvZHJtL2lteC9LY29uZmlnICAgICB8IDIgKy0KPiDCoGRyaXZlcnMv
Z3B1L2lwdS12My9LY29uZmlnICAgICAgfCAyICstCgpGb3IgaS5NWCAvIElQVXYzLAoKUmV2aWV3
ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CgpyZWdhcmRzClBo
aWxpcHAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
