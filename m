Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C115348C1DD
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jan 2022 11:01:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67B42C5F1F5;
	Wed, 12 Jan 2022 10:01:34 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55B70C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 10:01:33 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id a18so7711655edj.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jan 2022 02:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T5yvoHZXf5sRcIr28nRZ918Ghx2PDXySAnpXVpTEeyo=;
 b=IFnPU1h6tQdehMMmQirBcyt3PUDYvOYItJ7Gc2qM2IvjLICD+XK0IF0sEZnFTQ6aHg
 n2++qzfy9+/2SstO58HcFlkSXrXky9rMusNMOMWIom7d7hQeTilkwcspTekZ2lKPzg4r
 0xpEifFX8O1cCdxr8NyqVOr4UxU7UKQscxxcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T5yvoHZXf5sRcIr28nRZ918Ghx2PDXySAnpXVpTEeyo=;
 b=uy/PqwT6bIxRFCYf4tqP+3Q2rWh/2OAKI37s7EzZDfZMg9liPnWjeVJu88YvEPYiyV
 /f9LQkR9cfNXaZA4njKTO4hntXv3xgIKKbgTJOgkpHs6wan1hua2nFSNTYxkBqKb0KwO
 Ymyv98UpVk4IfnsnsGPYVk1K5Ot4BlLJ2cAph6EgLgHDSRUICT0o98SLdfze6kuikE5i
 24rKbV3DUUFlSrCzTadTMdgYH2iMat+QP2lAYaHtojzf1/nIcEdxS7SFtAZJ9kF+ZMT7
 7eXwkBqTGbwq/CUUYLnVN95sjYBfbj0gmk4dlOc8Yfe8mvoPnWNdpgsWRNI6DdHWOkXf
 yg4A==
X-Gm-Message-State: AOAM531t4X1nk/GwFDK/zqN3HRVyxjX0axp5TtTSK9aQYJRYy/D1uoyn
 XIYKFWpF+/AorNimjx+kGZ8FODejOFb7OELw/opAdw==
X-Google-Smtp-Source: ABdhPJzBCKeQImyBz9RVwKOY2T54xBFQQK7yDRACZFnbHnlAKzoMjJH8dsFKhcz6QDIsGnLn67HJYp60Nwck4y9NKCk=
X-Received: by 2002:a17:906:bc56:: with SMTP id
 s22mr7649762ejv.760.1641981692859; 
 Wed, 12 Jan 2022 02:01:32 -0800 (PST)
MIME-Version: 1.0
References: <20211222090552.25972-1-jose.exposito89@gmail.com>
 <20211222090552.25972-7-jose.exposito89@gmail.com>
In-Reply-To: <20211222090552.25972-7-jose.exposito89@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 12 Jan 2022 15:31:21 +0530
Message-ID: <CAMty3ZD_R+Tzab-qcWEcbTKVCKq3pNTi7Mr7903Vu9a9M5EefQ@mail.gmail.com>
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: marex@denx.de, mcoquelin.stm32@gmail.com, s.hauer@pengutronix.de,
 tzimmermann@suse.de, kernel@pengutronix.de, airlied@linux.ie,
 contact@emersion.fr, intel-gfx@lists.freedesktop.org,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, yannick.fertre@foss.st.com, linux-imx@nxp.com,
 benjamin.gaignard@linaro.org, rodrigo.vivi@intel.com,
 dmitry.baryshkov@linaro.org, shawnguo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 6/6] drm/stm: ltdc: Drop
	format_mod_supported function
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

T24gV2VkLCBEZWMgMjIsIDIwMjEgYXQgMjozNiBQTSBKb3PDqSBFeHDDs3NpdG8gPGpvc2UuZXhw
b3NpdG84OUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlICJkcm1fcGxhbmVfZnVuY3MuZm9ybWF0
X21vZF9zdXBwb3J0ZWQiIGNhbiBiZSByZW1vdmVkIGluIGZhdm9yIG9mCj4gdGhlIGRlZmF1bHQg
aW1wbGVtZW50YXRpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBFeHDDs3NpdG8gPGpvc2Uu
ZXhwb3NpdG84OUBnbWFpbC5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogSmFnYW4gVGVraSA8amFn
YW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+ClRlc3RlZC1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1h
cnVsYXNvbHV0aW9ucy5jb20+ICMgaS5Db3JlIFNUTTMyTVAxCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
