Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE404790BF7
	for <lists+linux-stm32@lfdr.de>; Sun,  3 Sep 2023 14:46:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99343C6B44C;
	Sun,  3 Sep 2023 12:46:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87CE0C0356E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  3 Sep 2023 12:46:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 545AE60C4F;
 Sun,  3 Sep 2023 12:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA498C433C8;
 Sun,  3 Sep 2023 12:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693745185;
 bh=VVXJthKSMlJi75kl9Cv7LXhu+JdojgrKZICCzMQ2eaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JKnhCmoB/f1GxHq2YkWcXFNUuVCNZhXjeQsuEFgwQpfY7fAVThRMuX5OD05d7Z9K6
 vG91DODKuV7ZZMvWigvCeyUgrD5kD9T7fTEHUvoR7Tz6ePyJj7xD879sXr8bUIcohc
 Jx2nOUk2ucTkcpUF0HZlQjD7ZOYESoLeO2kR6U28OlMpSVsteziW/ZLO4a1ZjPV/ZI
 oAut3VEwVykWdrTWaLcaXj9aJ/26nUbWZplXZLSXRlevwDPVwANpsYAJ+F+XNpS5JL
 73RBjU/PNuXY9T6NvcmHTY1qs2J4X9BeqIJrfRDkj1xAzfUKWFmCEkJ/UHJBjxhMdj
 Za/E0hlY1cksA==
Date: Sun, 3 Sep 2023 14:46:20 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Sean Nyekjaer <sean@geanix.com>
Message-ID: <20230903124620.6yrnpbpj37on6wih@zenone.zhora.eu>
References: <20230816080552.3045491-1-sean@geanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230816080552.3045491-1-sean@geanix.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3] i2c: stm32f7: Add atomic_xfer method
	to driver
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

Hi Pierre-Yves, Alain,

mind taking a look here?

[...]

> @@ -357,6 +357,7 @@ struct stm32f7_i2c_dev {
>  	u32 dnf_dt;
>  	u32 dnf;
>  	struct stm32f7_i2c_alert *alert;
> +	bool atomic;

this smells a bit racy here, this works only if the xfer's are
always sequential.

What happens when we receive at the same time two xfer's, one
atomic and one non atomic?

Andi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
