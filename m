Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D3247E11C
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Dec 2021 11:10:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3B9DC5F1F7;
	Thu, 23 Dec 2021 10:10:24 +0000 (UTC)
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F32D0C5F1F5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Dec 2021 10:10:23 +0000 (UTC)
Date: Thu, 23 Dec 2021 10:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1640254223;
 bh=JZk2QkwvQMw2dr3xN0Nul1fIObR/x6Mzssnku9CKGxI=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc;
 b=jogA9ITM2pLDQetcpufIntC4yTHzrr4+DWIpmT87TPMpju4Ot4RMQ+WoPBM247Tpu
 O8vwV/m9VY6TxbagfU0VqDfUoySRpsVQo8xeuk9rtka7kmhULzDeBU2qj80qLAr/Pl
 tyDxdNlMTeN0/VI1nIPmPi2rBZGD7vDOaQvRjOwGNN+LymeR2yX0gOrADjxqBRv/DK
 ozo9R/9VLfI7qonEXrrdE+T/byG6eNDz/7xkaNdebwMR90q+uJRbnzVrYS6X2DgczQ
 EA5Qt9X6ExeKkKVzmhOOM5KaR6wD89AGhOi8m7lMoK37T0naYw47i++tgbFwpoVybB
 Jjs8alSOHkPVQ==
To: =?utf-8?Q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <8OwW5vWFemsZ6SHYICEo6Ic972ApufOImdVLLprAxvjF3AxrjQghwFAZsQ1WJNqrv2fCTyB16g4JALC8omFmZ8-vcmTV289KfBEIkKMS5xc=@emersion.fr>
In-Reply-To: <20211222090552.25972-2-jose.exposito89@gmail.com>
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
 <20211222090552.25972-2-jose.exposito89@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
Cc: airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 alexandre.torgue@foss.st.com, stefan@agner.ch, benjamin.gaignard@linaro.org,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 Ville Syrjala <ville.syrjala@linux.intel.com>, marex@denx.de,
 linux-imx@nxp.com, intel-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 s.hauer@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, daniel@ffwll.ch,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 jani.nikula@linux.intel.com, yannick.fertre@foss.st.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 dmitry.baryshkov@linaro.org, shawnguo@kernel.org
Subject: Re: [Linux-stm32]
	=?utf-8?q?=5BPATCH_v2_1/6=5D_drm/plane=3A_Make_form?=
	=?utf-8?q?at=5Fmod=5Fsupported_truly=C2=A0optional?=
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

T24gV2VkbmVzZGF5LCBEZWNlbWJlciAyMm5kLCAyMDIxIGF0IDEwOjA1LCBKb3PDqSBFeHDDs3Np
dG8gPGpvc2UuZXhwb3NpdG84OUBnbWFpbC5jb20+IHdyb3RlOgoKPiBNYWtlICJjcmVhdGVfaW5f
Zm9ybWF0X2Jsb2IiIGJlaGF2ZSBhcyBkb2N1bWVudGVkLgoKTEdUTSwgbmljZSEKClJldmlld2Vk
LWJ5OiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1lcnNpb24uZnI+CgpDQyBWaWxsZSBqdXN0IGluIGNh
c2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
