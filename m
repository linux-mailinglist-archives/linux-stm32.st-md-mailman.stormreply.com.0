Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF44F487B5E
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jan 2022 18:26:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AACCC60460;
	Fri,  7 Jan 2022 17:26:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C9BBC5F1F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jan 2022 17:26:08 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 2-20020a05600c02c200b003470f96e778so3145740wmn.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 07 Jan 2022 09:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ht1OfskK18Tncu8hyQlhD7qZAAQL5kUIMY/RPcI5GWg=;
 b=ovBuHMMnaNmXki6e8ZuoIbwSgvKSbD1rksXRBmgyYUmyP/xeQbqX4CMXw2qDxMN1Vj
 v7Bki5RCHpIU0e56V7Y7EQ3kE2ZXPFmptqvRvDxQZ7chM4UIxRpXdp4o+0LjlKd7pW8q
 cXEGNj0CLps7TCexKvhCcrnl6NC6GUvVbPn8655XITD+oVFX6A77Yf0ibTqVflUqhgVm
 PGjvs5ZFG+72tWQn2lyUd3vH8tp3g1Iw+bUZuz3gxylapUn9yZgbIyZOi1em49vjoi94
 cNXMt0hYVQD9rJAfir0whVAbi7g644rWd6NP5cRkYKgohSf4SMg+HMJ/SIjKzTUI7Shm
 kngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ht1OfskK18Tncu8hyQlhD7qZAAQL5kUIMY/RPcI5GWg=;
 b=S9giCiJ9OB2t94WR7Y529IANIXnlOGsNPb97kLWPHSbf096e2qs0oiUIGxcTvagGDY
 SPi3QtekvxppiSCKqmQ25yONZcWm4CEtAfTIwFb1jRDb01nck3tCGPxCN98CuP+MIMQX
 amUU3bFI6j3/iekrMrnvplhkR1eMzUpYfYZZreIJJHYaKt6B+2xckpT7CCbvJMsobzSe
 EVAmCltTCQkTSnj09QkYtkEHicEabQ7gb9ek8QhKLYKbTx8DJE4RTnL+zn+L4F8s7d/y
 KrC2uA4N3HzmwHSR3+HXLOnm5OmrMIO91CKwErplZ0ncNvnIxphvtO7NnlqZgielpINM
 jIyg==
X-Gm-Message-State: AOAM530fFZI9Kdco3ouxyd/TR+vULwqLOfMVxB28l3Q7Lv9nPB3DKMM4
 w7k0mJVPnENcTvS0KERAWKs=
X-Google-Smtp-Source: ABdhPJxKyHsrAgQTVgZgLm+52z4ULS2Pqwjxj4lcuAMX76VGeJnjfcycUSa/PS919Hvdw9jf9FQEkg==
X-Received: by 2002:a1c:5403:: with SMTP id i3mr10241280wmb.66.1641576368115; 
 Fri, 07 Jan 2022 09:26:08 -0800 (PST)
Received: from elementary ([217.113.240.86])
 by smtp.gmail.com with ESMTPSA id s10sm8325202wmr.30.2022.01.07.09.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 09:26:07 -0800 (PST)
Date: Fri, 7 Jan 2022 18:26:01 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Simon Ser <contact@emersion.fr>
Message-ID: <20220107172601.GA122757@elementary>
References: <20211226112503.31771-1-jose.exposito89@gmail.com>
 <20211226112503.31771-3-jose.exposito89@gmail.com>
 <3DdB6YPUQr4O063yNreefZcIm6p5Z6HORoVVbk5RTMmjz8qvnxMse42hLvfDmA323KG-TWLc_JUFZEEEIkoINXQuAzjLVe2jRRM01tQgYOU=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3DdB6YPUQr4O063yNreefZcIm6p5Z6HORoVVbk5RTMmjz8qvnxMse42hLvfDmA323KG-TWLc_JUFZEEEIkoINXQuAzjLVe2jRRM01tQgYOU=@emersion.fr>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Simon,

On Wed, Jan 05, 2022 at 11:54:43PM +0000, Simon Ser wrote:
> Pushed patches 1 & 2 to drm-misc-next. Thanks for your contribution!

Thanks a lot for the review and for applying the changes, appreciate it.

Is there something that needs to improve in the other 4 patches?
Or just waiting on maintainers input?

Thanks,
Jos=E9 Exp=F3sito
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
