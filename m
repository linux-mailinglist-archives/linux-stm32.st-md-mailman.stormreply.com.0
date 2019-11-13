Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCB7FB4A0
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Nov 2019 17:06:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6579C36B0B;
	Wed, 13 Nov 2019 16:06:35 +0000 (UTC)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95BCBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 16:06:33 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id s14so834584uad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2019 08:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ayLEgLCWpr2v/YpRT1vekWIlyB7F5pG92dGazdBvwI=;
 b=G0C2zq6m15OVUAh+WFhsjZYXXzcdOByoFghlCOloPCUxpwsOe48d6TWKiBYF1Jt+3P
 pCkyi8gtQTCFIBPO9DwTV6c0WxkptrtOWz4iYPnK/cnKPm7I5zvj+dxET+BVtJ1DQpne
 xvFFiYgEs8mmbZJfAKBvvDnvS95WxPpEuPkR3s9WkN17IYO9Pb5tGG3tSajwy1byyD4N
 F16i2K46Gs2g/bj6Gi2+PLQDxaHl6IMmz66pxEDl3gH6mDW5O41D81GUalCuv66KK2kl
 pzplG0H99Acg6QnE2CyrhUpnwJAaLbkNCMS71/7karx00Scg1v8aAwzEcypXqj1ia3qp
 NQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ayLEgLCWpr2v/YpRT1vekWIlyB7F5pG92dGazdBvwI=;
 b=G1TvFGYyUmVYfCDpZDR1uPzbuXH/IP2q0148VOqIDVo9RI8vXWCw1VJ7u/nX9LBTEo
 +4QTBS8VVn1wF2KSMmiorstJ+aR/HMvSTICeLiyjb9xmU6QB2qMtK+tVBSbeeR/IKN+F
 321SyfkuuWicGoMa8ePKFz65FzrRSwFdYhWQ3zfhYTjb3xSmu8nwi1cXMSgFbhUhSVnb
 u1WfJSShYXKXp6nDeq3a5u61nCOJtcPuDPYgSrg0s49nqMD8Gi/XFyZID5NCDnm98RmM
 5eDdJPpuwaSP9AzL9vsE0wLhurUhXeHMMsMxFi/sRkYZO8mK+egC/GCmD16AZXP3YzUv
 2T9A==
X-Gm-Message-State: APjAAAXu3RaSaxJ+zcMkOFnlTZkWI7RtU3K/5OCGy3piF9s9RQByqImp
 UWeVEtF64tMqUQKr9yHGFOOupK0mbUR4kcvngJc=
X-Google-Smtp-Source: APXvYqyzUYrhlIoEugbzPslmvADNMfF2xvcbUO3zTaYeh1c05O5Pyx2U0QDgD4P1JCUm3NiogsNTTpD6/UoykImOIHY=
X-Received: by 2002:ab0:14e8:: with SMTP id f37mr2288342uae.64.1573661192697; 
 Wed, 13 Nov 2019 08:06:32 -0800 (PST)
MIME-Version: 1.0
References: <20191106163031.808061-1-adrian.ratiu@collabora.com>
 <20191106163031.808061-5-adrian.ratiu@collabora.com>
In-Reply-To: <20191106163031.808061-5-adrian.ratiu@collabora.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 13 Nov 2019 16:06:05 +0000
Message-ID: <CACvgo506P+qNUg8vbpxY0_E7AAwJMHseM=Jwb3c2K8zo-v-2qQ@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martyn Welch <martyn.welch@collabora.com>,
 Sjoerd Simons <sjoerd.simons@collabora.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com,
 LAKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 4/4] dt-bindings: display: add IMX MIPI
 DSI host controller doc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, 6 Nov 2019 at 16:31, Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Please drop this one. I'm not that experienced in DT to provide
meaningful review.

Actually, I've just noticed that respective maintainers/lists are not
CC'd on the series.
Please use the get_maintainer.pl script got get the correct info.

Personally, I read through the output, adding only relevant people as
CC in the commit message itself.

In particular, I don't think adding the "maintainer: DRM DRIVER" or
the "ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" are required. On the
other hand "DRM DRIVERS FOR FREESCALE IMX" and "OPEN FIRMWARE AND
FLATTENED DEVICE TREE BINDINGS" seems pretty accurate for what you're
doing here.

HTH
Emil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
