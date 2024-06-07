Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 77633900AA2
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jun 2024 18:46:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2754CC7129F;
	Fri,  7 Jun 2024 16:46:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7AB1BC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jun 2024 16:46:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4820261EBE;
 Fri,  7 Jun 2024 16:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5478C3277B;
 Fri,  7 Jun 2024 16:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717778783;
 bh=9soF2Dca9cc8N19dsRYxKK4fnoA4knis7MNTRdapdIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UIl0FQ43kLDTq/5kSJGPigMUBiGF+vWcdmGWSfjdA/e94hdfhvBtHyeiWJhZXGI9K
 2aSSfdqFTPn0mSwu9yoxqlNR0sp5DXzs9TpAKzxmUx2CU3RQOPijl5V1t8amEEM9vF
 c8PjWyZ/ZCAk21XnMlKPSQU9p7DOiE4e3A9sAPs8HZBuIsD0VkZJyU8EmA5+zbqUJT
 V9uGMDBNpLSItYDqL3xme8Oh4oAY+jI9JBtVMypcM0u2N9byQstWt8+tUg9TrydLtn
 RF5UlLQTCeBP8PSJO5KeekMzpaDfB7iRoYYBv+jbK9xlxNgxN7T/HxuTPME4BGbk5u
 DSnc2XL7KL9tw==
Date: Fri, 7 Jun 2024 10:46:22 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <171777877866.3290379.8347507744430863687.robh@kernel.org>
References: <20240607093326.369090-1-arnaud.pouliquen@foss.st.com>
 <20240607093326.369090-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240607093326.369090-4-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, op-tee@lists.trustedfirmware.org,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 3/5] dt-bindings: remoteproc: Add
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


On Fri, 07 Jun 2024 11:33:24 +0200, Arnaud Pouliquen wrote:
> The "st,stm32mp1-m4-tee" compatible is utilized in a system configuration
> where the Cortex-M4 firmware is loaded by the Trusted Execution Environment
> (TEE).
> 
> For instance, this compatible is used in both the Linux and OP-TEE device
> trees:
> - In OP-TEE, a node is defined in the device tree with the
>   "st,stm32mp1-m4-tee" compatible to support signed remoteproc firmware.
>   Based on DT properties, the OP-TEE remoteproc framework is initiated to
>   expose a trusted application service to authenticate and load the remote
>   processor firmware provided by the Linux remoteproc framework, as well
>   as to start and stop the remote processor.
> - In Linux, when the compatibility is set, the Cortex-M resets should not
>   be declared in the device tree. In such a configuration, the reset is
>   managed by the OP-TEE remoteproc driver and is no longer accessible from
>   the Linux kernel.
> 
> Associated with this new compatible, add the "st,proc-id" property to
> identify the remote processor. This ID is used to define a unique ID,
> common between Linux, U-Boot, and OP-TEE, to identify a coprocessor.
> This ID will be used in requests to the OP-TEE remoteproc Trusted
> Application to specify the remote processor.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> update vs previous version
> - merge [PATCH v5 4/7] remoteproc: core introduce rproc_set_rsc_table_on_start function
>   as new "st,proc-id" is associated to "st,stm32mp1-m4-tee" compatible
> - update commit message
> - remove Reviewed-by: Rob Herring <robh@kernel.org> as patch is updated
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml   | 58 ++++++++++++++++---
>  1 file changed, 50 insertions(+), 8 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
