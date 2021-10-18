Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C7A432796
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Oct 2021 21:29:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2259C5A4D8;
	Mon, 18 Oct 2021 19:29:45 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F566C5A4D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 19:29:44 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 v2-20020a05683018c200b0054e3acddd91so1139224ote.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Oct 2021 12:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uxaQFenmJzGwC+IUubS4cWsAXC6ECKn16PE13Pm+TzQ=;
 b=B+TTPzhyHKKlbIv4IdGhQIPKgIbJ66tZAuJUebm4Ha8NuYspun5ooJuO7225DBcTc6
 EsMUS+yrV6xP0E28dCPL+AS+4zdv8Q53SQxjxeNoiN1OY++ifsUvt2rXQZUTsuI+7MyS
 1gAINGNPO+syiG1xQq/d6Yjt8PQdzJOm8kkTLVov/zum6LOf5SLwnA5Oi+xvY9Z1gRDR
 +u3NGOoO4Oa7X4T2jwlZWhOP2FJIiz4R8UYV+VAGlKEchulXiieCX91ebGnLko5Q/8DA
 0IZfCjT0b2wnTn/5iPeGHv3ABj3TjdJiesn96Tdp/7l4jlcW7NknavEyeiuDwDcxeE3I
 VV/Q==
X-Gm-Message-State: AOAM531x35JTh6/d7Cy7nPuafvgcVUrUpUj+Z4k8jKaDwbXePRIcVH+Y
 xuvgHZ7Vc//AUHOaJUfkfQ==
X-Google-Smtp-Source: ABdhPJxQt1AtyRJgxbShImCdxQMW79KrP3k81bFkVpuAM4lbP8oIQTaSCyu7Ectm95KWhvJBq11R4Q==
X-Received: by 2002:a9d:842:: with SMTP id 60mr1466167oty.302.1634585383054;
 Mon, 18 Oct 2021 12:29:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id u21sm3104983oiv.25.2021.10.18.12.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:29:42 -0700 (PDT)
Received: (nullmailer pid 2805582 invoked by uid 1000);
 Mon, 18 Oct 2021 19:29:41 -0000
Date: Mon, 18 Oct 2021 14:29:41 -0500
From: Rob Herring <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Message-ID: <YW3LJWOCzZm3jxuJ@robh.at.kernel.org>
References: <20211015161427.220784-1-amelie.delaunay@foss.st.com>
 <20211015161427.220784-3-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015161427.220784-3-amelie.delaunay@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/3] dt-bindings: phy:
 phy-stm32-usbphyc: add optional phy tuning properties
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

On Fri, 15 Oct 2021 18:14:26 +0200, Amelie Delaunay wrote:
> This patch adds the description of new optional phy tuning properties
> for usbphyc phy sub nodes.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
> Changes in v3:
> - Use -microamp instead of undocumented -milliamp
> - Add '|' after 'description:' on each property needing this
> Changes in v2:
> - st,phy-tuning property removed
> - tuning properties are now put directly in each child node
> - tuning properties are no more free form text and their name reworked
> ---
>  .../bindings/phy/phy-stm32-usbphyc.yaml       | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
