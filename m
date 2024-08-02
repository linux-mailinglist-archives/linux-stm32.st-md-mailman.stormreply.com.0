Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDCC9462CF
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 20:01:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89041C7129D;
	Fri,  2 Aug 2024 18:01:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 62748C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 18:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722621669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HVTfFpaLZUbOaQ0HJhEjOqrkLc8CExWlF+kJqRyqPAo=;
 b=Ek60RuF/LgWh/BQpNK2GhOr2Jj2aYBjbVE8xweClLQOK8x+UNpuVSpZV+8mVPeNY/tLuYm
 frou8eqsWDCYutwLqBUs+viquVlPle6JZ/Rr/8NhrVa9SqoE2IrYJdDhWdKcwvvcp6ugS/
 coZFKDbemeGsLd4NJAhup/CaUDpGg58=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-2A6KQIFTMw-rZdWhS6i9ng-1; Fri, 02 Aug 2024 14:01:08 -0400
X-MC-Unique: 2A6KQIFTMw-rZdWhS6i9ng-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7a1d44099a3so998127185a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Aug 2024 11:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722621668; x=1723226468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HVTfFpaLZUbOaQ0HJhEjOqrkLc8CExWlF+kJqRyqPAo=;
 b=pT0B9u2hH/Ss74j1JIBnfAtgrk9DsLPO3IXMy0czkZIXwUKze03epsdgZfBImr90sn
 NdUlacqdRIevDKRgoyjTFEFLoGJYGIYt3xEtzvAoe6jIJM4gbivrvjcntX31o5nH7HnW
 fZ7Kb51VsKsXgmDiHH2GJSQVDacbZXhYsnSGQonOc7FB1lI5RewShEA+R/AgLyck3g2S
 5KU7WS4BQDJe0umYAiHcKYDHppyABH5CfoWf56GLDx/nzr45z6500ZqPNgYIFXncoCnz
 dX+G2BDEdK+hzoKQW46jucam5fej9w2YvjePb1Wsfyl6bypf7DB4d/Ibtg0rrM1euc9X
 aW1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRNTvGKcBkYN17So9up8QV8CsuuvsX8hfg/cz1dU5xhd7Y9OzuvEKDc/BEpAhCWkdlNsGDT0oTi/lF85Mdt2w35gznkHGNM2k7thXM0hs0uB+zALpfqVIs
X-Gm-Message-State: AOJu0YxBBnuEm2VNiSGjmpX834/WcrABtOEARgZ2jDulsieSBXwT5fb/
 lai9kjyogjd6EgipfapkcWsDOVjRIZZLbDhaZUk7LzWCw6Wo9WP86E0XnxkikL/FiUbiHAN7jvl
 CffPtIZAhaJ3eHir2eHezcAwQa5V3KH74TNM2gmKy4wgy7CA6tLgqW+iFuOXshXRLXVOBCHdbZk
 nPYg==
X-Received: by 2002:a05:620a:46a4:b0:79f:735:4cfd with SMTP id
 af79cd13be357-7a34efaeea7mr554499285a.50.1722621667646; 
 Fri, 02 Aug 2024 11:01:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQJErAfbeHi7Cr/9xQl9lT7goXT1BrY20xVWa1C2WQla2ME5KtsJNYLix6zqIYtiFu1FmZog==
X-Received: by 2002:a05:620a:46a4:b0:79f:735:4cfd with SMTP id
 af79cd13be357-7a34efaeea7mr554496585a.50.1722621667225; 
 Fri, 02 Aug 2024 11:01:07 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a34f6dca50sm107699185a.16.2024.08.02.11.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 11:01:06 -0700 (PDT)
Date: Fri, 2 Aug 2024 13:01:04 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <idusdyewthu5q4j7awi3rc77ncdolt27ppq2pknrbynaobgztc@3xvnkeqml2bd>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpnw-000eGw-2F@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sZpnw-000eGw-2F@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 02/14] net: stmmac: replace
 ioaddr with stmmac_priv for pcs_set_ane() method
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

On Fri, Aug 02, 2024 at 11:46:36AM GMT, Russell King (Oracle) wrote:
> Pass the stmmac_priv structure into the pcs_set_ane() MAC method rather
> than having callers dereferencing this structure for the IO address.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
