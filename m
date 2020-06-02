Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6CA1EBC2B
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jun 2020 14:57:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE691C36B21;
	Tue,  2 Jun 2020 12:57:03 +0000 (UTC)
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AF1BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2020 12:56:59 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id q15so1202635uaa.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Jun 2020 05:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BpsIlBQ5nejFohRETbNb9q04gA6fq5BCcsSBn6KKApI=;
 b=JetxGkcmZWwBcj73qk5GvrPQ52LZYWBhk1chHXBbYxrojwIOYCdLU6/e4biJGuow5b
 tVoDhU2dirPxe0+SQa6spJ5Di7Jjk0/Bkgco+Tpe0Z3oAFDHwh0KzP7w92q5qj/3/x3Q
 9L8vVzBOe32M8mc6kbcNKPmzg0fzMn/paYJ/jnoHguC1SPWDNX9zXsXanb+WqbRV+249
 QMj5r88MFMgwB/mim2CvQ6KmhxANKMbwldClAaVj/3SBwiVC5ZmtFzpv9tadk+xPBodH
 xg5ImqIr4I7KAgHbdnae1fbbQpdjwEwen0yl9P7/GvxCOo+2LHlSYtreF+iVF4LI/u8f
 8AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BpsIlBQ5nejFohRETbNb9q04gA6fq5BCcsSBn6KKApI=;
 b=pJ2oakP0f9R7smarAje6GIXftxrKMOVvAH7Mljy7VaFj+40ynVewsgORN+qLG5MBFy
 +wblhQ43szBJRGJReJll1B+XtJv/GC3QpHMwNNfGGVcjmikAitunczc4vGrtfT13sLBW
 WrdbI1kQ5D6dhZev9rRgf8dSG3fWZOekOLkIiTguc8lmOok3IRMj0VJP8qzEBRQuqgGF
 qcNWtFLgwk0XV1/h2AM/cuj1vL/FxguOrYQREywz/S0rZWMjz8tNS6pCkCFt4cY1IFAD
 xV2//oSawYm5OquqIXK/H6veKITePQT+RpIM/4vZzipUMdoYaqL/5h0KJigy6VQhwF0T
 q5TQ==
X-Gm-Message-State: AOAM533azCMxC/PbZvejXTAXl3dsOSUQa7F+oGQDIoNLNsk9zRAgGu0r
 njlp5F3QRIrCuJdVTSadpfrp5BEHkBbXVEUIZJQ=
X-Google-Smtp-Source: ABdhPJy94b4dAChxDuW4wDOKIg2tO2nMimj827DSzBUBaeBS4xq/NcIVF/RbxLJKqEmvBcwkcK/jKU0XrmmGsie+2ZA=
X-Received: by 2002:a9f:22e1:: with SMTP id 88mr13225614uan.19.1591102618237; 
 Tue, 02 Jun 2020 05:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200427081952.3536741-1-adrian.ratiu@collabora.com>
 <20200427081952.3536741-9-adrian.ratiu@collabora.com>
 <4acc09e8-0610-01f6-b18d-3ffc390c45a3@st.com>
 <87blm387vt.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
In-Reply-To: <87blm387vt.fsf@iwork.i-did-not-set--mail-host-address--so-tickle-me>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jun 2020 13:53:40 +0100
Message-ID: <CACvgo51QyzEa8LFpGq5zjYV-0TifQRtNh4WhMYy8jNtaswxd7Q@mail.gmail.com>
To: Adrian Ratiu <adrian.ratiu@collabora.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Adrian Pop <pop.adrian61@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>
Subject: Re: [Linux-stm32] [PATCH v8 08/10] drm: stm: dw-mipi-dsi: let the
 bridge handle the HW version check
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

Hi Adrian,

On Mon, 1 Jun 2020 at 10:14, Adrian Ratiu <adrian.ratiu@collabora.com> wrote:
>
> On Fri, 29 May 2020, Philippe CORNU <philippe.cornu@st.com> wrote:
> > Hi Adrian, and thank you very much for the patchset.  Thank you
> > also for having tested it on STM32F769 and STM32MP1.  Sorry for
> > the late response, Yannick and I will review it as soon as
> > possible and we will keep you posted.  Note: Do not hesitate to
> > put us in copy for the next version  (philippe.cornu@st.com,
> > yannick.fertre@st.com) Regards, Philippe :-)
>
> Hi Philippe,
>
> Thank you very much for your previous and future STM testing,
> really appreciate it! I've CC'd Yannick until now but I'll also CC
> you sure :)
>
> It's been over a month since I posted v8 and I was just gearing up
> to address all feedback, rebase & retest to prepare v9 but I'll
> wait a little longer, no problem, it's no rush.
>
Small idea, pardon for joining so late:

Might be a good idea to add inline comment, why the clocks are disabled so late.
Effectively a 2 line version of the commit summary.

Feel free to make that a separate/follow-up patch.

-Emil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
