Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 220369184E9
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 16:53:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3401C71282;
	Wed, 26 Jun 2024 14:53:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EF35C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719413603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YrKnBGUsXzxltAg01s3o4kyy9jXBJCa6pgwUhoUuJvY=;
 b=Uha9DsMubmkV0mKfIm7DnMdWg2sJOX0IrjSmmlkL2Zlq2/3bRlL+Gyi9SGhjOiNhEwVuNr
 eZSL88OXsjAWOnYGUEGsgSlgMpQpc8jT2FVLrBo5R1c14wHBWfBFqKfrd/jDE1lc/mBEcH
 GpMIWSXjGBoxPanOd9s4UFVatb9ov28=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-zEL3RjQEMROXJ52ZUlp48g-1; Wed, 26 Jun 2024 10:53:22 -0400
X-MC-Unique: zEL3RjQEMROXJ52ZUlp48g-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-79d5509f112so83826085a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 07:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719413600; x=1720018400;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YrKnBGUsXzxltAg01s3o4kyy9jXBJCa6pgwUhoUuJvY=;
 b=W0ulyTU8YPfUzLkX3ysPhAsfJcsxHr9e+f+v2pftSHcJ9rSPtmsinicfjpaIf0IQQk
 Ik/LZh4WMQyFI7F6MhfY6sDRhtpymBwj4SFHNzVXzyzAhOpg8VpDyEHIabmyLDy4g22/
 XKvmlTtU1fZe/+KjDhsQLIl6lPFuTH4Qvi7QjSjcFTR+9SbPmhOy+BVl5rVOJ44OLiIj
 LW56MsFJaXBz4XkKcFqZ8j534xz63Fm8vASWMbBbr7xONKMPRwQkkp0Gqq/aJKDqC0YM
 4oUzkI7F+fo9ZCsMII6wJ6tLuty30bOP0grIjUaJGOziwbht51rMrh6bGWU4YJh0XN0J
 StBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkVg2yww9BYTr7l8pSMInIz2k2r4B+1I0kl1cYEEe+Q9h071DCRw8F1u1oikT0gUY3LuC9JlnMqAf/EUq7lkakDKeSYlHHeS7Wx2TsDfPBWztwZWNlb9qZ
X-Gm-Message-State: AOJu0YyAwkrZcsbF8I6daNb0tTGjFUSXIg5gzYt571rQ5H7i3gNRiq0+
 aS+rPFxhTXZ8a7VE8VApyKMcrr1uAQt6ML34ZD4VXlnannqD86FUVl6QhtXbM6qwysVwPgv+Y2+
 GBd0TtIjpUu3+2VMcdO9/KdnqUyu0hiyBN+SQrS6eemkEj50+LcnlqgJsq+1zWWtfqkq0GX2pm2
 8B3A==
X-Received: by 2002:a05:620a:1998:b0:79d:5414:68d2 with SMTP id
 af79cd13be357-79d54146b12mr159311485a.44.1719413599690; 
 Wed, 26 Jun 2024 07:53:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7rWL9/p+Lnv9AbO8zaoMmKP9NuiF/Sz5Kmi1mA7Vt5rgp/9627GpolyqUJFKWM3RKg3m/gg==
X-Received: by 2002:a05:620a:1998:b0:79d:5414:68d2 with SMTP id
 af79cd13be357-79d54146b12mr159308585a.44.1719413599165; 
 Wed, 26 Jun 2024 07:53:19 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::f])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79bce89a5d5sm505133885a.19.2024.06.26.07.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 07:53:18 -0700 (PDT)
Date: Wed, 26 Jun 2024 09:53:16 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Message-ID: <q2ou73goc2pgrmx7xul4z7zrqo4zylh3nd2ldxw5vnz2z4fnkf@axbse4awc6lf>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-1-eaa7cf9060f0@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240625-icc_bw_voting_from_ethqos-v2-1-eaa7cf9060f0@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Russell King <linux@armlinux.org.uk>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: net: qcom: ethernet:
 Add interconnect properties
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

On Tue, Jun 25, 2024 at 04:49:28PM GMT, Sagar Cheluvegowda wrote:
> Add documentation for the interconnect and interconnect-names
> properties required when voting for AHB and AXI buses.
> 
> Suggested-by: Andrew Halaney <ahalaney@redhat.com>
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 6672327358bc..b7e2644bfb18 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -63,6 +63,14 @@ properties:
>  

Does it make sense to make these changes in snps,dwmac.yaml since you're
trying to do this generically for stmmac? I don't poke bindings super
often so might be a silly question, the inheritance of snps,dwmac.yaml
into the various platform specific bindings (qcom,ethqos.yaml) would
then let you define it once in the snps,dwmac.yaml right?

>    dma-coherent: true
>  
> +  interconnects:
> +    maxItems: 2
> +
> +  interconnect-names:
> +    items:
> +      - const: axi
> +      - const: ahb

Sorry to bikeshed, and with Krzysztof's review on this already its
probably unnecessary, but would names like cpu-mac and mac-mem be
more generic / appropriate? I see that sort of convention a lot in the
other bindings, and to me those read really well and are understandable.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
