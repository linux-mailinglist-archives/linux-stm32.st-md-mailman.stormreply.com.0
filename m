Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 474B08133C0
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Dec 2023 16:00:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED13CC6B47D;
	Thu, 14 Dec 2023 15:00:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38235C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 15:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702566021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PIwlzkGZzMvRZOVi6rK3/dvdCnIiAOyQaAI+3BjBK4I=;
 b=YiuvhV5dxgNWB+T6Ab4XJ/+9gM2mg7HfHLSAYfSlCIgtrtN9StGxD1QqVuLptjryzgSIWv
 gm6hbxcRG35ymAy67XiBm458ZiMJJ+wc03bGchk3bTEBKZLVgYHnXKCrM9qUZJ01dv1NDm
 HyP7m1neS3TpiJPi5j2sw4FDHchfaCg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-g8xEaybSPCWGMbch-dmMYA-1; Thu, 14 Dec 2023 10:00:19 -0500
X-MC-Unique: g8xEaybSPCWGMbch-dmMYA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a1f72871acdso134183266b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Dec 2023 07:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702566018; x=1703170818;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YWD8flG08948c+kk5diZhSkaE4l4o5OrXgP93+sWFH8=;
 b=Qn7x2GM27xr7K/ZSTMh+cV2zjPmn75Blza5z8eZZiDMANwGA7d3jg/pk1CRarC9wOp
 5bQdupMRSXBPae5T30HXYEKCKyRf2TbaXlWktdsghbXpbVFreged8Qv5gaGbeJk3fXKt
 LdpXIi1A2qeOe7/FPZBbPS0gSE/UGyr6Y93v7o4wPjp8D8m2xo7iqGJ046oTEr5mKH3b
 8cbj6KOasZnFfj/vb7LU3Nwy9YcW/3tvyNAf42QeyCW5ThGqeyrM3HGOrZwFgfbapTkM
 m5H2nd90v1fySn1seMYDTyVZv9yumlA22kiZhl+BFsM5Rbc0iipbMqkyV7OtO4qkL9ZG
 OYCQ==
X-Gm-Message-State: AOJu0YyuE6UE5vqVC29LhHI6Atse+L1rkcrxUD/BZwMzxMyiCXXUt3TO
 Hx0PTqFvRTdvaXtmFif1iR/4TV/Bih62+6rIq1XvqBGjdtbYw2+4KRKYv5tbAuQuooTz0oj+/4m
 WSAYb3AvPJs8CqFusQHudhzUen7Ity5zdYU/a+hn5
X-Received: by 2002:a50:c349:0:b0:552:8299:65fc with SMTP id
 q9-20020a50c349000000b00552829965fcmr853885edb.4.1702566018702; 
 Thu, 14 Dec 2023 07:00:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEObJZISOhVTutkg5qzmkvSZBjnemH0WpgDmhPCj1LJegEvnc1zWHUUA1QXUujGyd6isycDyg==
X-Received: by 2002:a50:c349:0:b0:552:8299:65fc with SMTP id
 q9-20020a50c349000000b00552829965fcmr853840edb.4.1702566018356; 
 Thu, 14 Dec 2023 07:00:18 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-252-36.dyn.eolo.it.
 [146.241.252.36]) by smtp.gmail.com with ESMTPSA id
 cn10-20020a0564020caa00b0054ca2619c1bsm6867552edb.9.2023.12.14.07.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 07:00:17 -0800 (PST)
Message-ID: <fa171d50e1a20019b4b2bf302043278909b9072f.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Suraj Jaiswal <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,  Konrad Dybcio
 <konrad.dybcio@linaro.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, Prasad Sodagudi
 <psodagud@quicinc.com>,  Andrew Halaney <ahalaney@redhat.com>, Rob Herring
 <robh@kernel.org>
Date: Thu, 14 Dec 2023 16:00:15 +0100
In-Reply-To: <20231212115841.3800241-4-quic_jsuraj@quicinc.com>
References: <20231212115841.3800241-1-quic_jsuraj@quicinc.com>
 <20231212115841.3800241-4-quic_jsuraj@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: kernel@quicinc.com
Subject: Re: [Linux-stm32] [PATCH net-next v6 3/3] net: stmmac: Add driver
 support for DWMAC5 common safety IRQ
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

On Tue, 2023-12-12 at 17:28 +0530, Suraj Jaiswal wrote:
> @@ -3759,6 +3763,7 @@ static int stmmac_request_irq_single(struct net_device *dev)
>  	struct stmmac_priv *priv = netdev_priv(dev);
>  	enum request_irq_err irq_err;
>  	int ret;
> +	char *int_name;

I'm sorry to nit-pick, but please respect the reverse x-mas tree above,

Otherwise LGTM!

Cheers,

Paolo


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
