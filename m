Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6006E95111C
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Aug 2024 02:43:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06B88C6DD66;
	Wed, 14 Aug 2024 00:43:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8ACC7C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2024 00:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723596183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=neqRTcEj9/zj+36l4CNYLscl48VCNlUw8+/D/Uqo/H8=;
 b=eUub+uTfXlb/iOfKvAq/GOiLr/pp+8NxLE+cU/2FiUv2wGzp5mqQu6cU7DwQv1mCe3NmDB
 WleUBffjlAv0yRSlhNnFwNzsaMASX71s7F0ljlK3DLFh3m6vRZRzO4WKdjB6m88eDFKYjU
 6m6Duk2MNwppMAFxQ7vOmsP8GRzn7Jc=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-fYwP9Ki2OkitCZoeM2HS4w-1; Tue, 13 Aug 2024 20:43:01 -0400
X-MC-Unique: fYwP9Ki2OkitCZoeM2HS4w-1
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-5da50ab90c0so3046764eaf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Aug 2024 17:43:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723596179; x=1724200979;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=neqRTcEj9/zj+36l4CNYLscl48VCNlUw8+/D/Uqo/H8=;
 b=C6znEUOPPnIQE/3Oc2R3dihU+b9fgOSQwW3ZFM/C5K3ussFXZiAHOSwzHeinktITvw
 nJ7KW41toGWdFGLMl3ss8bsRwyssBItR4/DN+eWijLRaey2wxjP2vSpMm5mS9EflEu4x
 4O/P75d7e5GlIftZqzsqI6oyT0B1IYS7lI2QXrCKehNellnYrui1PoBhubCfCl5k6obV
 9NFavMQ7j3inbY50TDHYaalNgYn+dr0WPkIThL1LsORYJOqERt3AjN/IifRC/gg36PmE
 TQbHu1uhCqUgfb54UWYDKEoguvLwPuFFIPOAO928WIOMI999G2fs6Sh0rF++FxMAEjPP
 CERQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtydvkbP761zTprG7KUtHMdk254+DkB8Jmr63/7kleqEnIyp3eNUaQL/oD7qrvpHTrV9NWQNlwbJmJ1SKyAZA22CP0Zh3bANhF+Qo9fd9V79Al1BCyAU1q
X-Gm-Message-State: AOJu0YzIF+eT4fjvG4SdL4fdSrmQ0M6VV+Yd6lUBPVEEdlbUmizWz3DL
 rdHIaFaClVjcLouUTeHCMoacPzZBZxYx/gpIrAtn76wqtgMXUmgxbkh6k65z6KjVF0RG6+KJeJl
 GfWRKrm4tYVc5faaLzktgO5AkmZeeQvZPEoS1Xx9sRpRIsO18NRRGnbEq+ofRJWfKQwW78naRt8
 TcoA==
X-Received: by 2002:a05:6358:5709:b0:1aa:bde7:5725 with SMTP id
 e5c5f4694b2df-1b1aad56c0amr166436055d.28.1723596179316; 
 Tue, 13 Aug 2024 17:42:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTcmIh03e3B7xSn2L7DkI7RRKwpSIiec73Jgf5I9h/tC3e+8R44UqAGwk+9QzPwWzu5FYJxQ==
X-Received: by 2002:a05:6358:5709:b0:1aa:bde7:5725 with SMTP id
 e5c5f4694b2df-1b1aad56c0amr166433455d.28.1723596179007; 
 Tue, 13 Aug 2024 17:42:59 -0700 (PDT)
Received: from x1gen2nano ([184.81.59.2]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a4c7ded208sm383575085a.89.2024.08.13.17.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 17:42:57 -0700 (PDT)
Date: Tue, 13 Aug 2024 19:42:55 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Serge Semin <fancer.lancer@gmail.com>
Message-ID: <lq326y6bjavnvrn4nre2kwetwnu2oiv7rrjbb7iol44xckgu5w@gjaedc7arxxb>
References: <20240809192150.32756-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240809192150.32756-1-fancer.lancer@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Fix false "invalid port
	speed" warning
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

On Fri, Aug 09, 2024 at 10:21:39PM GMT, Serge Semin wrote:
> If the internal SGMII/TBI/RTBI PCS is available in a DW GMAC or DW QoS Eth
> instance and there is no "snps,ps-speed" property specified (or the
> plat_stmmacenet_data::mac_port_sel_speed field is left zero), then the
> next warning will be printed to the system log:
> 
> > [  294.611899] stmmaceth 1f060000.ethernet: invalid port speed
> 
> By the original intention the "snps,ps-speed" property was supposed to be
> utilized on the platforms with the MAC2MAC link setup to fix the link
> speed with the specified value. But since it's possible to have a device
> with the DW *MAC with the SGMII/TBI/RTBI interface attached to a PHY, then
> the property is actually optional (which is also confirmed by the DW MAC
> DT-bindings). Thus it's absolutely normal to have the
> plat_stmmacenet_data::mac_port_sel_speed field zero initialized indicating
> that there is no need in the MAC-speed fixing and the denoted warning is
> false.
> 
> Fix the warning by permitting the plat_stmmacenet_data::mac_port_sel_speed
> field to have the zero value in case if the internal PCS is available.
> 
> Fixes: 02e57b9d7c8c ("drivers: net: stmmac: add port selection programming")
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
