Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A68AD1C7C
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2019 01:10:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE0A3C36B0C;
	Wed,  9 Oct 2019 23:10:28 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98D77C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 23:10:27 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id h126so3820291qke.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Oct 2019 16:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=NTimbsKgKVFDwuRCQXDTlqAXzNdTJ0Hr/Eiu/ueYeWQ=;
 b=j1N3WnyQePch5c3ATnoCW8Gc5+utVUM07IPkUm9U5i1N1JvfqxJFhHzkKW934vUUlP
 WkvTVLgvTE4vl+TZ523OqX2PD2BC162vDZeljPWx3plErfZrydgfhBIbUm4Si1O7JuQ8
 KFdNtHeSfIjs8hVYdCqBuC7z01mVYUvA2DLlo76GRCdf/CtgLkEnXA6Z0trETa6mPkHf
 qw+2ujEP6/yOZsntZfx9+c3uhSPh1prUi4yCGrwvmiRrE5zjnK9zpU8wB6QCwFRuoqmn
 0HkXxV68gwvc4Sb8Ap5qeAJpn5pEnFjJ6dNTOpqRIc3z4GHLSG68hnzwQN8ar5PGZY96
 8tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=NTimbsKgKVFDwuRCQXDTlqAXzNdTJ0Hr/Eiu/ueYeWQ=;
 b=PFPly6xnGrwW4pY16O7A32S90GmVFv+9i7S0CE9sB7ugeZjnaESY5FUzTG/ay3neKD
 NnpIxiZyK/JGvT3LEQw39bvoXq/MtJXgFSSeM2OVRLHzNVFXfyoSrl11rmKxzRMF88hT
 wGxfTzGW9jDXqRA2IZBo6+nkSD/bjjOo6oWWtioGMK5wTKKYMwFWD0B2Gi8BaXycn7KB
 P6Ee8YXXXLk4D7iLqF8u2HBRMm2wL88GrZM6i3IwwJp8lMYee1H85WDVgCxfWrvquQjh
 xp6g7ZJaq4F9Y7o2f19J+625oNBgakbRvlbmEyDwN7Fc5y60KTyRraCJn5F3Hl2DurxN
 7rvA==
X-Gm-Message-State: APjAAAWE59rmbpWogoTYw54paPgXopzikNtrnU4CX+Zyn2YRv9CmycQ8
 AQQU+2jlLY/uA5j8hBtrkZCXWg==
X-Google-Smtp-Source: APXvYqxlFI2WcAzy9H2hDmeqvaySLV60xIVp+vEfJOOvBA+AepOhJJvAg79EbiCxLrXZdFhnQYnNxQ==
X-Received: by 2002:a37:6114:: with SMTP id v20mr6535756qkb.329.1570662626464; 
 Wed, 09 Oct 2019 16:10:26 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id h29sm2161423qtb.46.2019.10.09.16.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 16:10:26 -0700 (PDT)
Date: Wed, 9 Oct 2019 16:10:11 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Antonio Borneo <antonio.borneo@st.com>
Message-ID: <20191009161011.117c7f77@cakuba.netronome.com>
In-Reply-To: <20191007154306.95827-4-antonio.borneo@st.com>
References: <20191007154306.95827-1-antonio.borneo@st.com>
 <20191007154306.95827-4-antonio.borneo@st.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: fix disabling flexible PPS
	output
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

On Mon, 7 Oct 2019 17:43:05 +0200, Antonio Borneo wrote:
> Accordingly to Synopsys documentation [1] and [2], when bit PPSEN0
> in register MAC_PPS_CONTROL is set it selects the functionality
> command in the same register, otherwise selects the functionality
> control.
> Command functionality is required to either enable (command 0x2)
> and disable (command 0x5) the flexible PPS output, but the bit
> PPSEN0 is currently set only for enabling.
> 
> Set the bit PPSEN0 to properly disable flexible PPS output.
> 
> Tested on STM32MP15x, based on dwmac 4.10a.
> 
> [1] DWC Ethernet QoS Databook 4.10a October 2014
> [2] DWC Ethernet QoS Databook 5.00a September 2017
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
> Fixes: 9a8a02c9d46d ("net: stmmac: Add Flexible PPS support")

Applied to net, queued for stable.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
