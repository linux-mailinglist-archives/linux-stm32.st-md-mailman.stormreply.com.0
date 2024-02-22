Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4707486011A
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Feb 2024 19:24:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBBCAC69063;
	Thu, 22 Feb 2024 18:24:38 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79945C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Feb 2024 18:24:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 466B2CE28C1;
 Thu, 22 Feb 2024 18:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43084C433C7;
 Thu, 22 Feb 2024 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708626274;
 bh=x42gYfFIle5hMZRh275TRKsrYsjhPinQRyYzAvbClLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ENDhL9Lh247wVsy1yzU4AHQUn/r2Ra+9U5W5T1nwoWvQUHORHYW2dQJDMX6us/SsZ
 Kf+MH+cHbgHt8DLocbrYtO7O8/GszCzgx1/Cjwro0PU7rhoF3iB1Bd1ee3pIKvyBSh
 II4WRU5jieQ1yMD4OH3gJOxfef8bvwAPuqen1n9tw9uvrV7iNgwXXc2BTesd6/sFTe
 PMxgrqel9tEJmKPhUC2FFSJkK9JWCWyBrjdg1sUfWylGyiJ+/wNJ3Ne9yvihrjmKf2
 UDSHZ9YOyDhgdI/K/nh2yjVOWLlhTSdJ7KW2WRvaCMf9kwxhyWDGjUfBflwCi3aSWs
 8pY9PbfPtjvEw==
Date: Thu, 22 Feb 2024 12:24:30 -0600
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <170862626977.3652711.10744856298270939089.robh@kernel.org>
References: <20240214172127.1022199-1-arnaud.pouliquen@foss.st.com>
 <20240214172127.1022199-6-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240214172127.1022199-6-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, op-tee@lists.trustedfirmware.org,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jens Wiklander <jens.wiklander@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 5/7] dt-bindings: remoteproc: Add
 compatibility for TEE support
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


On Wed, 14 Feb 2024 18:21:25 +0100, Arnaud Pouliquen wrote:
> The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
> where the Cortex-M4 firmware is loaded by the Trusted execution Environment
> (TEE).
> For instance, this compatible is used in both the Linux and OP-TEE
> device-tree:
> - In OP-TEE, a node is defined in the device tree with the
>   st,stm32mp1-m4-tee to support signed remoteproc firmware.
>   Based on DT properties, OP-TEE authenticates, loads, starts, and stops
>   the firmware.
> - On Linux, when the compatibility is set, the Cortex-M resets should not
>   be declared in the device tree.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> V1 to V2 updates
> - update "st,stm32mp1-m4" compatible description to generalize
> - remove the 'reset-names' requirement in one conditional branch, as the
>   property is already part of the condition test.
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 51 ++++++++++++++++---
>  1 file changed, 43 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
