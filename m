Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA36CE981D
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Dec 2025 12:10:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA328C8F26D;
	Tue, 30 Dec 2025 11:10:32 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67804C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Dec 2025 11:10:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D0CD6000A;
 Tue, 30 Dec 2025 11:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9382C4CEFB;
 Tue, 30 Dec 2025 11:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767093030;
 bh=cbvXc3P0gkf4daKd1w9/tAFqdLjRVYHyMeg6AMHP2II=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jj2yeHVNMmcWbZyQ36+LsSqqhNrtnHbfbuBptIp2dJC9tpdZ2dUqoxzH8uM6U4nOO
 c8YKQI3+3VLUa1uMz3vu/GaVWH8AE/gXfc6AW9OqQ7mcPmLDpS3P4a79iExn7QA/TC
 3KUwP+ScfDmyPf3afJ0CCy8iKO5grkAEX8Aq7RBKBUHyiPalEeTxN88D2p2JEKKnNg
 LRdyueOslm5SLJU2uOCyT7aVMqaAAfpuyChpy+iYoN+f+aW3ek03ZgqAPr82ASPYWK
 TWsVQzmjCu9iGYtsxlKEPAxes3k5fKUBZDmse9Q8s1I1E6v9WPLEqWTZFpe5Ykk5tz
 r26EZ2pH+d5/A==
Date: Tue, 30 Dec 2025 16:40:21 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <aVOzHWmlJ-eneS-2@sumit-xelite>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
 <20251229232530.GA2753472-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251229232530.GA2753472-robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, op-tee@lists.trustedfirmware.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On Mon, Dec 29, 2025 at 05:25:30PM -0600, Rob Herring wrote:
> On Wed, Dec 17, 2025 at 04:39:12PM +0100, Arnaud Pouliquen wrote:
> > Add a device tree binding for the TEE-based remote processor control
> > service implemented as an OP-TEE Trusted Application identified by
> > UUID 80a4c275-0a47-4905-8285-1486a9771a08.
> > 
> > The TEE service node is a child of the "linaro,optee-tz" firmware node and
> > acts as a container for remoteproc devices that are controlled via TEE.
> 
> Is this generic for any remoteproc device or just ST's remoteproc. Looks 
> like the latter to me.

That's true, the DT description of the remoteproc subnode is very
specific to the vendor which in this case is ST.

> 
> > In addition, the "linaro,optee-tz" binding is updated to specify the
> > '#address-cells' and '#size-cells' values used for child TEE service
> > nodes.
> 
> I'm pretty sure I already rejected per service/app child nodes for 
> OP-TEE when its binding was submitted.

That was the reason to have discoverable TEE bus in first place and I
have been motivating people to dynamically discover firmware properties
rather than hardcoding in the DT.

> If we do need something in DT 
> to define some resources, then can't we have some sort of 
> standard/common communications channel? I don't care to see some sort of 
> free-for-all where we have every vendor doing their own thing. OP-TEE 
> needs to standarize this.

I suppose this requires a wider scope work as you can see the DT resource
dependence from here [1]. By standardize communication channel, do you
mean to say if adding an alternative backend to fwnode for TEE in
parallel to DT, ACPI or swnode is the way to go for discovering fw
properties? Or do you have any other suggestion here?

Along with that the corresponding subsystems has to adopt fwnode APIs
instead of OF APIs.

[1] https://lore.kernel.org/all/0e5a44df-f60a-4523-a791-6318b3c81425@foss.st.com/

-Sumit
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
