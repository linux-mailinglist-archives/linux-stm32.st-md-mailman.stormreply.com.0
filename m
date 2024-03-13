Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4F387A455
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Mar 2024 09:57:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF7ECC6C83C;
	Wed, 13 Mar 2024 08:57:05 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60132C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Mar 2024 08:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=7Z3xpgxMC3SabrhTXAHSyPXqOmddBGRm2jLKIlBKce0=; 
 t=1710320224; x=1711529824; b=TI6lNOACXkrwSdrHlwf+pzh0VjArvyq5uACvdIJ+WGRiaBR
 WZ9EMzJ5+bjUFpxxqmE+NEHDt0LYEE4vUul+SEhnaEAhm9IIktcNVV4HvMIhcJkeojPbNfxaE8U74
 VvJQSTpvheyrkcW7x+yK2oKeZtMk0eWFLavzwgmH7v8PpoUd+SiEoKLyw5rfvmyl5s0ejRpp0fyuE
 GHWDYm5lWNKDqNaBOQJlXJhd/4W/JcfxxLyYOg5uIoj+kdYThQjXlb4O5k/mk+mqPsSrfXE2P/xce
 cgW9w1psXcZzkZo03QxMXKy62+qLjexBvPYfLqMTFhSepTnX7KJabbCqDLLUcigw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97) (envelope-from <johannes@sipsolutions.net>)
 id 1rkKPv-0000000F7E9-0rbB; Wed, 13 Mar 2024 09:56:55 +0100
Message-ID: <005f998ec59e27633b1b99fdf929e40ccfd401c1.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: Karel Balej <balejk@matfyz.cz>, dimitri.ledkov@canonical.com
Date: Wed, 13 Mar 2024 09:56:53 +0100
In-Reply-To: <CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz>
References: <CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz>
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
Cc: herbert@gondor.apana.org.au, linux-wireless@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, mcgrof@kernel.org, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-modules@vger.kernel.org, iwd@lists.linux.dev,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [REGRESSION] Re: [PATCH] crypto: pkcs7: remove
	sha1 support
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

Not sure why you're CC'ing the world, but I guess adding a few more
doesn't hurt ...

On Wed, 2024-03-13 at 09:50 +0100, Karel Balej wrote:
> 
>  and I use iwd

This is your problem, the wireless stack in the kernel doesn't use any
kernel crypto code for 802.1X.

I suppose iwd wants to use the kernel infrastructure but has no
fallbacks to other implementations.

johannes
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
