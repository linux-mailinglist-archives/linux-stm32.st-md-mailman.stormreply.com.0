Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E0B5FF572
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 23:32:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13224C65041;
	Fri, 14 Oct 2022 21:32:49 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4AF7C6411F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 21:32:47 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 c13-20020a4ac30d000000b0047663e3e16bso1881152ooq.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 14:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVyH5ppmeLm9SOZr74i6fTL8JuopDsI3RJLzigzFYWI=;
 b=QOhZ+axqfXjorCuD0MG9VHr8X5UnfmGEx7IUMXj4p24TDnoSefu+OlsvCp7oydDWpP
 1lt2slaj6rwAhKCTgH2byyr5/98++lMqkCqAusEWV34ZKUMNhDDvuSF1jCVfI3dfO5/2
 yTQ1BLG2WQgP8sd6200t7krxMVpqR+JsFnPOb+gq1bTenHBAPsVx5x4YwnsFdjAM3UNs
 /YDNqB7j5reLSVzLVOnMS9Dn1PKbfxDHHI4f9ifPt1VoMuRFysZ+9mQONB37duCuyjE8
 RzVjX+G6Zym72ntBs6XwtwP6PifqOuuQ5LvNCZ7QCVMNzeo8KPX8cOYJbhJcnqgqolMh
 Bpkg==
X-Gm-Message-State: ACrzQf3sk6BHO5JJbDO2A5IyS/+KsybeJR52+E4eVCvmZdNJ8yO3lnlT
 OOys5mJflxIdRMBl6L5LKw==
X-Google-Smtp-Source: AMsMyM48eD18qFAwbjuP2QLLGMmCexEbpR/cfrktU3suYYJfdqfjzaSfN+CXrnhEdtn0X1TNnQBmxQ==
X-Received: by 2002:a05:6820:811:b0:476:6b2:4cd2 with SMTP id
 bg17-20020a056820081100b0047606b24cd2mr2736553oob.84.1665783166319; 
 Fri, 14 Oct 2022 14:32:46 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 eo18-20020a056870ec9200b001326b043f37sm1838777oab.36.2022.10.14.14.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 14:32:45 -0700 (PDT)
Received: (nullmailer pid 2937600 invoked by uid 1000);
 Fri, 14 Oct 2022 21:32:46 -0000
Date: Fri, 14 Oct 2022 16:32:46 -0500
From: Rob Herring <robh@kernel.org>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Message-ID: <166578316635.2937544.10153180806992297540.robh@kernel.org>
References: <20221014172324.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221014172324.1.Ifc1812116ff63f5501f3edd155d3cf5c0ecc846c@changeid>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: nvmem: add new stm32mp13
 compatible for stm32-romem
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

On Fri, 14 Oct 2022 17:23:27 +0200, Patrick Delaunay wrote:
> Add a new compatible for stm32mp13 support.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
