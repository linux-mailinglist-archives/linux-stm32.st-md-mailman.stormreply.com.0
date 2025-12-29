Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D75AACE8521
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Dec 2025 00:25:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 899FFC58D7C;
	Mon, 29 Dec 2025 23:25:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 737CAC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Dec 2025 23:25:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 09E6A41697;
 Mon, 29 Dec 2025 23:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29ADC4CEF7;
 Mon, 29 Dec 2025 23:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767050731;
 bh=gBic61XhRnhOC+5nNfIY22uN2UTZjrJ0gw/UGoHisUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aY9VGVHhUxXe6n10yUd3Ij+dXkWLdgZUtVl2t7HHs71hCLrC6/bpMaQhij2BtIOKX
 8I9pes7DADMkBv7d6XdEZdDndszB06v88ncLpH1JwJCzwgDIQiwzlEfOBK3CVDDrJ7
 g6AWyiwCStbcLLy2cD90Xpf77wPXM7KUN3Ziq614OHCEYrBfIKMXAvKJ9+da00RSoa
 Eh9kpcEtN61/0dJ7xPJwAQ65YtSVVmkC4MX/rIBohFQKt5HUe9P7lLhDT6eM6sme6f
 supwRhDPB4Lf3Vpl4g88tqGjg4ygBBa7DKyXeAli3xv7pGi007KfbwA4t9pS90CUcg
 ZBVU67HBEptBQ==
Date: Mon, 29 Dec 2025 17:25:30 -0600
From: Rob Herring <robh@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Message-ID: <20251229232530.GA2753472-robh@kernel.org>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 op-tee@lists.trustedfirmware.org, Sumit Garg <sumit.garg@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v20 1/6] dt-bindings: firmware: Add TEE
 remoteproc service binding
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

On Wed, Dec 17, 2025 at 04:39:12PM +0100, Arnaud Pouliquen wrote:
> Add a device tree binding for the TEE-based remote processor control
> service implemented as an OP-TEE Trusted Application identified by
> UUID 80a4c275-0a47-4905-8285-1486a9771a08.
> 
> The TEE service node is a child of the "linaro,optee-tz" firmware node and
> acts as a container for remoteproc devices that are controlled via TEE.

Is this generic for any remoteproc device or just ST's remoteproc. Looks 
like the latter to me.

> In addition, the "linaro,optee-tz" binding is updated to specify the
> '#address-cells' and '#size-cells' values used for child TEE service
> nodes.

I'm pretty sure I already rejected per service/app child nodes for 
OP-TEE when its binding was submitted. If we do need something in DT 
to define some resources, then can't we have some sort of 
standard/common communications channel? I don't care to see some sort of 
free-for-all where we have every vendor doing their own thing. OP-TEE 
needs to standarize this.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
