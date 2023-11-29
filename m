Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 933EE7FD2D7
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Nov 2023 10:35:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37D86C6B475;
	Wed, 29 Nov 2023 09:35:38 +0000 (UTC)
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 727A6C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Nov 2023 09:35:36 +0000 (UTC)
Received: from hillosipuli.retiisi.eu (185-9-10-242.cust.suomicom.net
 [185.9.10.242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: sailus)
 by meesny.iki.fi (Postfix) with ESMTPSA id 4SgDhM3nDpzyQm;
 Wed, 29 Nov 2023 11:35:28 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1701250535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qBMtK94Go2Qx3A8vq16Az09u3ZHaqoIiuqWziee6a/8=;
 b=U2OgepDEX3JXK/Uy0lZIuhn7HqvTKwStbn/1/hieTCH3Wp+MTYc9YO3zpdDc+dDGVBz1EE
 bPGNJWMN6ymD/iIfTrEwP0NpHRY5Rqqfia12ezhGhtBlF7VcHJP8y5QIKcM8jlo7cwyaik
 mnLQ/n5MT0m0J/xyQZr7LlAXEt1I4m0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1701250535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qBMtK94Go2Qx3A8vq16Az09u3ZHaqoIiuqWziee6a/8=;
 b=onqBuo4pUwtq+exTLJRnadXdbZMH710QEai0aU6KTp3sO2iqbCAtSuepiXo8Bb4VKqaJpv
 Pta2EElIE4U9nCj8Mq+TwaSRyiqH9LQ+83whUDRs2d5XuaPrtNXHTDF+tvlkWIniXNVEr3
 W0/Z1hpVHVyo9KwD6L96Q1pzzJX5C5s=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1701250535; a=rsa-sha256; cv=none;
 b=VDNXvY+hJj7kCbvBOKDaQ30Y5Ccx8KYgrGBB48Tu1ViiDqHql50oElByTXp3QQTC4GQFXi
 vkbL8tofbxj1eo394ot+wSE+BQ2eKiPhygRRltJhzhh3g+w02yvcR+M5wFoxt7xqG1Kt5s
 5bJ5oh3YZ7n3SS4OcnlJx7q68yNSBO0=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 110BD634C93;
 Wed, 29 Nov 2023 11:35:28 +0200 (EET)
Date: Wed, 29 Nov 2023 09:35:27 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Alain Volmat <alain.volmat@foss.st.com>
Message-ID: <ZWcF38Pd97bAbHvf@valkosipuli.retiisi.eu>
References: <20231128201404.237856-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128201404.237856-1-alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmipp: correct kerneldoc
 issues in dcmipp-common
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

On Tue, Nov 28, 2023 at 09:14:03PM +0100, Alain Volmat wrote:
> Correct kerneldoc issues regarding:
>   - dcmipp_ent_sd_register
>   - dcmipp_pads_init
>   - dcmipp_colorimetry_clamp
> 
> Rename as well dcmipp_pads_init parameter from pads_flag to pads_flags.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

Thanks, Alain. I've squashed this to the driver patch.

-- 
Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
