Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C63487B68
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jan 2022 18:29:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8050C60460;
	Fri,  7 Jan 2022 17:29:32 +0000 (UTC)
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDA67C5F1F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jan 2022 17:29:31 +0000 (UTC)
Date: Fri, 07 Jan 2022 17:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1641576570;
 bh=UiTlyBo9UuvfhzocANog0JAKgTNkVZpUBxSayY9p2tE=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=GAauKnGMTyEXiFfCB/6NXgNZXkVYvCukP7KR+50OnPx0xmNzSXyo70fbab5XGx6ZX
 gxwDRNAQZl9tweSDOfxQYGN6bI04/u4vrJnFk82UsvYYqXRO/k8m/iDjdGLdg7NZik
 TIJIbiDbKhZNgLv+B9Q+TLr3wEhHERsQfW3M3o7MGD4PV+yxYYcFeVLObLQDXSwLUD
 Hi9TLYSZHMPMDEsiaQaJvLvn9TghvS2bW6mGvCT3eO8lYzkZm/0C9iCCZlG/V1TpXL
 kIRWEKbpaC/u4T1xHlFwYdVi2WAZ7xmbKAT2NXUCwZTVeHnr6vqpD4XPBwKrDrMQRW
 /rdLFvZ8Hiz2w==
To: =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <zTX9uSmiLpHhH2VG6QBEkyfzqLTLylulwnf54f-fsx7Qp-ePGWW9gJJm-whTbo35o0TKd_hzV_f5Ir977j0A_sMeXCXZ8nofLNV6Q9Rzwwc=@emersion.fr>
In-Reply-To: <20220107172601.GA122757@elementary>
References: <20211226112503.31771-1-jose.exposito89@gmail.com>
 <20211226112503.31771-3-jose.exposito89@gmail.com>
 <3DdB6YPUQr4O063yNreefZcIm6p5Z6HORoVVbk5RTMmjz8qvnxMse42hLvfDmA323KG-TWLc_JUFZEEEIkoINXQuAzjLVe2jRRM01tQgYOU=@emersion.fr>
 <20220107172601.GA122757@elementary>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
Cc: airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 alexandre.torgue@foss.st.com, stefan@agner.ch, benjamin.gaignard@linaro.org,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 ville.syrjala@linux.intel.com, marex@denx.de, linux-imx@nxp.com,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch, s.hauer@pengutronix.de,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, yannick.fertre@foss.st.com, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, dmitry.baryshkov@linaro.org, shawnguo@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 2/6] drm/plane: Fix typo in
	format_mod_supported documentation
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gRnJpZGF5LCBKYW51YXJ5IDd0aCwgMjAyMiBhdCAxODoyNiwgSm9zw6kgRXhww7NzaXRvIDxq
b3NlLmV4cG9zaXRvODlAZ21haWwuY29tPiB3cm90ZToKCj4gSXMgdGhlcmUgc29tZXRoaW5nIHRo
YXQgbmVlZHMgdG8gaW1wcm92ZSBpbiB0aGUgb3RoZXIgNCBwYXRjaGVzPwo+IE9yIGp1c3Qgd2Fp
dGluZyBvbiBtYWludGFpbmVycyBpbnB1dD8KClllYWgsIHRoZXNlIHBhdGNoZXMgbG9vayBnb29k
IHRvIG1lLiBGZWVsIGZyZWUgdG8gYWRkIG15IFItYi4KCk1haW50YWluZXJzIGZvciB0aGVzZSBk
cml2ZXJzIHN0aWxsIG5lZWQgdG8gcmV2aWV3L2Fjay9hcHBseSB0aGVtLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
