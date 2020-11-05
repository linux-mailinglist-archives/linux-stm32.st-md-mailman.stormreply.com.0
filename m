Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4AF2A89C1
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Nov 2020 23:28:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C46DFC3FAD4;
	Thu,  5 Nov 2020 22:28:18 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FE1CC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Nov 2020 22:28:15 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id z16so2952731otq.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Nov 2020 14:28:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HAB4TfB3OG5D83YaeTiy/sDYe1f16TcNEMvC+v0nD1E=;
 b=Mu0sggGcQFLldnftdQ21gC1UEl/AYJwOop6/I1IAyb2N5qtX0P1biycU1k+/MsGjI3
 /uRrPyT7nA0LF1+bHJ8boTM+BZBd/T6U9oZQZ5ZPSXMCM0jmzztLpo5H+Qw/tHD8dviR
 qabcBLBx2kOb5KAG6J642dIy8OudyaMLrGDJT2AhsskhjqzI5jAbg48i2YBI2TZAA9XL
 lcExGkkFkjTeru6mzchZSjYFwW1u6SuncUciYECHE7uZZCtGe/yWnB20BBrns1osBC0u
 fpHjulJUSVDwgrWng4FQDFHBZj9IWi2QN1s9tZk9tvgV6VLUdZpV8927E0OXaFM3Sddq
 TRLg==
X-Gm-Message-State: AOAM530vUrCDylJR2EXmvlTlciW0JES7MivzqnuGUI8d+1v4fmoY8+wT
 5Uyt/H9t7L9fYn0+nxPzPQ==
X-Google-Smtp-Source: ABdhPJxYhbRjqk86zYy6aUoBiL/gprHxtyRj1prSv8IZnbJiDbQwuuV5tw+1saXj7G4H/i1LuT0TIg==
X-Received: by 2002:a9d:682:: with SMTP id 2mr3291412otx.317.1604615294791;
 Thu, 05 Nov 2020 14:28:14 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v10sm633636otq.69.2020.11.05.14.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 14:28:14 -0800 (PST)
Received: (nullmailer pid 1915203 invoked by uid 1000);
 Thu, 05 Nov 2020 22:28:13 -0000
Date: Thu, 5 Nov 2020 16:28:13 -0600
From: Rob Herring <robh@kernel.org>
To: Hugues Fruchet <hugues.fruchet@st.com>
Message-ID: <20201105222813.GA1915114@bogus>
References: <1604511132-4014-1-git-send-email-hugues.fruchet@st.com>
 <1604511132-4014-3-git-send-email-hugues.fruchet@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604511132-4014-3-git-send-email-hugues.fruchet@st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yannick Fertre <yannick.fertre@st.com>, Alain Volmat <alain.volmat@st.com>,
 Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v5 2/4] media: dt-bindings: media: st,
 stm32-dcmi: add support of BT656 bus
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

On Wed, 04 Nov 2020 18:32:10 +0100, Hugues Fruchet wrote:
> Add support of BT656 embedded synchronization bus mode in DCMI driver.
> Add "bus-type" property and make it required so that there is no
> ambiguity between parallel mode (bus-type=5) and BT656 mode (bus-type=6).
> BT656 mode allows to save hardware synchro lines hsync & vsync by replacing
> them with synchro codes embedded in data stream, hence hsync-active &
> vsync-active properties are useless in this mode.
> With DCMI, BT656 bus mode is only compatible with 8 bits width data bus.
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  .../devicetree/bindings/media/st,stm32-dcmi.yaml   | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
