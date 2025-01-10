Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B34EA0969B
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jan 2025 17:02:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25BC9C78F6F;
	Fri, 10 Jan 2025 16:02:33 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3A8CC78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jan 2025 16:02:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B1FDB5C06BB;
 Fri, 10 Jan 2025 16:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E656C4CED6;
 Fri, 10 Jan 2025 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736524945;
 bh=TZdtNZgzKfFSZDkfTfY1nF0VsjVWi6pk4YB+xNa4n7k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VExMSHCzE5s37sT9ikrAm/5ta2nYN0/bR7j1w2UBIcH8o7Jja7RqQy7lMFT8ZGHuo
 kx+s6Ld7bZ4e5gznnSyGJ4XX4Go7R6NVe8ZNiuNevwFY1XoO7e582AGc14A2iFpin4
 IF83rQjbjdqikYrZnVKnN+hmi8rOXXmpnnbniABXDxNmmLXpmUlAjhg+iQO+R26g4a
 m4Iwg/jmNGkYfXyNpbHiHpjsgJUtCKIFArat4bxXA/ZIwTAObS3fu0MzSIJ9R8WEDC
 2kHHWmzD8g491E7AGPERPLF6J2KV0RLHbt7Jk7lWK1AjnUGiPNqNs5qwRFSBqusdnR
 uKUHjoB4pmkGw==
Date: Fri, 10 Jan 2025 10:02:24 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <173652494400.2948275.17068411464064341962.robh@kernel.org>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
 <20250108-csi_dcmipp_mp25_enhancements-v2-1-05808ce50e41@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250108-csi_dcmipp_mp25_enhancements-v2-1-05808ce50e41@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 1/8] dt-bindings: media: clarify stm32
 csi & simplify example
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


On Wed, 08 Jan 2025 14:16:04 +0100, Alain Volmat wrote:
> Clarify the description of the stm32 CSI by mentioning CSI-2 and D-PHY.
> Remove the bus-type property from the example since this CSI has a D-PHY,
> which is the only bus-type option, making this property redundant.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> ---
> v2: clarify commit message related to bus-type property removal within
>     the example
> ---
>  Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
