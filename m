Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D3946353
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 20:45:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2D7CBC7129D;
	Fri,  2 Aug 2024 18:45:27 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83AD7C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 18:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722624319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K9JQ2Bf0SWejaUXaO1CuoWG99+H3ynJpTMEOSBOBAU8=;
 b=FV45IUAwD8WubsDylMxR8c0XFfn49ELblSYswLBieXzaoXcJkbHjeHKTwnId8RxgpJyB56
 AeV5ZT32hzOXS6wyllKA5aKuiRwr92RuAIh7uSzsyk5FCY9SdkBGRww+RVl+g1fw8H5TUf
 UlacApqnMvqd62cGskYGfahp81V2qZI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-ldmfue8nPqKsSdCUXMiWaQ-1; Fri, 02 Aug 2024 14:45:18 -0400
X-MC-Unique: ldmfue8nPqKsSdCUXMiWaQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-44ffb762db6so116378791cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Aug 2024 11:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722624318; x=1723229118;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K9JQ2Bf0SWejaUXaO1CuoWG99+H3ynJpTMEOSBOBAU8=;
 b=pTkKNLyPZile+9YS2PuUHW1SNq/a7elE5XCrTmBISXSfDcaWi356A3GDg125hbhq32
 J9JLENYMHIehinBSeHito9lNtLSSq5aW3oypSolVfckSq6BY/bPqsXOVHJjJ4TiNTcsU
 MRh2r4s9/MOpzygLnl/S0XEZT5aINsYpBUw9OCV+Zg/cGvsTr7NvmYacL//DxvvrBLgP
 Z995QGoy56yfw9KrfbJynNcBJKWNQzocDchRSL9tAi68Ud/QQSio9qUgBMwcipllg/kS
 xyiX2r/clZI1dS2NKbxgMNw5e4OQPhUuTn40NblSWThkWcDxy1IRWsEU17yShbVKgxsZ
 ybpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqq1kJXoRQYck14xO8HXq8YlKOD65S0+m5cRKC7nydydmNPGyG5336ABIj0VcUMqX42Rk3Sdlnw2TAF+LFb6HQFiRrY1PyPuONtPYEXyQf8Gi7W8LDcn3N
X-Gm-Message-State: AOJu0YyYJqggYHk4jl7dIik2HYkWBhZ44NHOrCJgMfxNVpOMEh4JvKJ6
 EVOh8heHqVUi9hm9Rb/Jv0A23OGLxDFe3pag0KQc76RFt3RdvtDrEd+K/6rWveFLhWKwsSSBDGa
 rycyLe4dQ93xnNWXxVOu+KfYCsMhKtQNDRwCiU8QzuAuwo2jM0+LVlUDDzzE2RSGceO+tuS48f9
 cI9A==
X-Received: by 2002:ac8:7fc4:0:b0:447:ee02:220 with SMTP id
 d75a77b69052e-451892ad6a7mr52630261cf.30.1722624317895; 
 Fri, 02 Aug 2024 11:45:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVwPo418K/j4TSG5frJ/PeeWs9ccUUjf6b01FC1y1GFDXNXPuzIYaN0JC6zJzw9tCN9/UwJA==
X-Received: by 2002:ac8:7fc4:0:b0:447:ee02:220 with SMTP id
 d75a77b69052e-451892ad6a7mr52629981cf.30.1722624317602; 
 Fri, 02 Aug 2024 11:45:17 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4518a757920sm9405371cf.67.2024.08.02.11.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 11:45:17 -0700 (PDT)
Date: Fri, 2 Aug 2024 13:45:14 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <4t4wd6bv3gzyzc4nbbszydnagvzgynluy2rb6jtfjxtidrmoqh@62cs3wx52pob>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
 <E1sZpob-000eHh-4p@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <E1sZpob-000eHh-4p@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next 10/14] net: stmmac: move
 dwmac_ctrl_ane() into stmmac_pcs.c
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

On Fri, Aug 02, 2024 at 11:47:17AM GMT, Russell King (Oracle) wrote:
> Move dwmac_ctrl_ane() into stmmac_pcs.c, changing its arguments to take
> the stmmac_priv structure. Update it to use the previously provided
> __dwmac_ctrl_ane() function, which makes use of the stmmac_pcs struct
> and thus does not require passing the PCS base address offset.
> 
> This removes the core-specific functions, instead pointing the method
> at the generic method in stmmac_pcs.c.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
