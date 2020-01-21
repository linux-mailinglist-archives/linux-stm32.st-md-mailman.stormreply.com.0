Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 211C31446B8
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Jan 2020 23:00:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D339BC36B0C;
	Tue, 21 Jan 2020 22:00:28 +0000 (UTC)
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D6DBC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 22:00:25 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id p125so4128106oif.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Jan 2020 14:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KLk2O/IKuSbiV0tR8rjrjmOXKw++jN6rlAX6P6oLFbI=;
 b=Urv3wIlz0TDkXxHghvu8F7c/WxCfWMWKaYMCJbr1Zbcd33y5bpuHTsed3Wt4koTodS
 mGLzKMaexDnV7PiXoujlrHJOSD/VUuqNKx4CBPHrfGb1mDdgDorkuEFIUvH9NEvo7KJ8
 Y5JjS8tv+rFTHppzb6D+opYh07tV2O5Brt3Uo8tiMQD+BR6VfPjpX7PoPRMqiAxXlifQ
 bEBl13n99K2oGd/2e4yREnRt8viFqe7UIoTO2pWuTDwQUeQ10HVHdBwmQ/T1mSY0zQwW
 30xm6x5TMhO4tpu7uvrM7kJsrVaZyolrAroMm23QIvkMjY1Wr5DORxDyzQkfBRQldHVt
 KSOQ==
X-Gm-Message-State: APjAAAX+jiNzyqKey7Jd687QmlA2EuQk8D6rwgXfjEovITsTiyzfCzSb
 X6uegQ0McsJFhNlK8zu3gg==
X-Google-Smtp-Source: APXvYqyrJcCLm65IFp9RrnaNPk0Kj24N9+PbvJbLGG+xddxwNzL2Rmb4y7wEB7BGH5EV0QhX139X+w==
X-Received: by 2002:aca:c74e:: with SMTP id x75mr4769148oif.140.1579644024678; 
 Tue, 21 Jan 2020 14:00:24 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 69sm13989543oth.17.2020.01.21.14.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 14:00:23 -0800 (PST)
Received: (nullmailer pid 13395 invoked by uid 1000);
 Tue, 21 Jan 2020 22:00:22 -0000
Date: Tue, 21 Jan 2020 16:00:22 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>
Message-ID: <20200121220022.GA12737@bogus>
References: <20200117170352.16040-1-olivier.moysan@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117170352.16040-1-olivier.moysan@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mark.rutland@arm.com, robh@kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, mcoquelin.stm32@gmail.com,
 perex@perex.cz, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] ASoC: dt-bindings: stm32: convert
 spdfirx to json-schema
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

On Fri, 17 Jan 2020 18:03:52 +0100, Olivier Moysan wrote:
> Convert the STM32 SPDIFRX bindings to DT schema format using json-schema.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
> ---
> Changes in v2:
> - Add "additionalProperties: false"
> - Also change minItems to 2 for dmas property, as both DMAs are required.
> 
> Changes in v3:
> - Drop minItems/maxItems for dmas property, remove ref to stm32-dma.txt.
> ---
>  .../bindings/sound/st,stm32-spdifrx.txt       | 56 -------------
>  .../bindings/sound/st,stm32-spdifrx.yaml      | 80 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 56 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.yaml
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
