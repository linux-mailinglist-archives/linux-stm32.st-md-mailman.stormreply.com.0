Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 768A392BD30
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2024 16:41:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F8CBC6DD66;
	Tue,  9 Jul 2024 14:41:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B6F4C5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2024 14:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720536060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9dNUMlILD/JowgtlDpz/3Xfo0pUbwll0dZL3HCPAgDc=;
 b=bIM2e2h9Pjg7mRDcdEvJM93WhUHb9cu8xDb19p2FZxe7oGA06lyx1BhFGmjswtuapdl8fa
 cSQV+/VxGCF3UGiw0/nzJPNwzX8HeWaN8o3cTEAeuO6Pe3gz/MVsr4A0JlnoYV+xuVQsU8
 WGl79J6AsY3Yvd962u+mjVd5mY66vVQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-OJWgAYt6P3macfNwqsHRtA-1; Tue, 09 Jul 2024 10:40:58 -0400
X-MC-Unique: OJWgAYt6P3macfNwqsHRtA-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-79efc85b0dbso471925285a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jul 2024 07:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720536058; x=1721140858;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9dNUMlILD/JowgtlDpz/3Xfo0pUbwll0dZL3HCPAgDc=;
 b=cs9IJSowfywaKcYl1Y+DA4CNaPLl1AryLVyx8W4VazmFlSukM6btsGhvQQQAuCrdQw
 dLEDQqLsjm97OFjGWZh+osrmERylJubz4BEdhhIEuU6KNERcXk0ONg+5GEf6LWNS3gNo
 l86/wOapP9giim3+bu8mf558by6fcgphv7IF37rXgHncuFmBjBe8dzH7sxaLbooDbpaU
 5o7/WmzJZVxaEk03eBrKaiO88o8cQOouU4bbSrW+LDP1RfwMd41wK4n6Xu/R+ZPbx7dq
 ea6IQQmiJfrivCnknx74ycSEE8YF5icWJ0Vyi/L/6KEbS/x/aFAnGIIifeFAlgx63Kok
 uGiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKUoHLfDaJ8QcK/4W4GnGfV4QO0aY6ZsFHN2aWXoke6AZvcs+dkXDUbBpLN15rf/TaNXEk6E3Pmjt8z4qsFtPPGC4Nd1GABUrTRlTkNfEidfPj6DoSi75z
X-Gm-Message-State: AOJu0YzVv6k9nztNnDHYqFycH5pKl7t1PP/b0mCecdqkatboRH50zR0a
 ZhwQAAIwuG/F+obVij5QrOQuZVe27JV9GybegDaHNfXj2gGcIVgUrmGzHFCXvVlmowPScDru2XW
 m4babVM8cs0Ryt0WZwnjyj9vIXPw71oxwUFzDmrgSAtApYnlbyX+g0EKn/XW7C8+85AqdypqPEf
 vrIw==
X-Received: by 2002:a05:620a:1926:b0:79f:68a:4d10 with SMTP id
 af79cd13be357-79f19a64fafmr349734685a.25.1720536058312; 
 Tue, 09 Jul 2024 07:40:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnyT5xuAnGF3d6+RqcZrSyPI6vPv662QIU9QcvPWdPyiZO1DjY4R2T/cM0JO2WXzwX3CsQiA==
X-Received: by 2002:a05:620a:1926:b0:79f:68a:4d10 with SMTP id
 af79cd13be357-79f19a64fafmr349730385a.25.1720536057997; 
 Tue, 09 Jul 2024 07:40:57 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::40])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79f18ff834csm102827385a.5.2024.07.09.07.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 07:40:57 -0700 (PDT)
Date: Tue, 9 Jul 2024 09:40:55 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Message-ID: <g7htltug74hz2iyosyn3rbo6wk3zu54ojooshjfkblcivvihv2@vj5vm2nbcw7x>
References: <20240709-add_qcs9100_ethqos_compatible-v2-0-ba22d1a970ff@quicinc.com>
 <20240709-add_qcs9100_ethqos_compatible-v2-2-ba22d1a970ff@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20240709-add_qcs9100_ethqos_compatible-v2-2-ba22d1a970ff@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 2/2] net: stmmac: dwmac-qcom-ethqos:
 add support for emac4 on qcs9100 platforms
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

These patches are for netdev, so you need to follow the netdev
rules, i.e. the subject should be have [PATCH net-next] in it, etc as
documented over here:

    https://docs.kernel.org/process/maintainer-netdev.html#tl-dr

On Tue, Jul 09, 2024 at 10:13:18PM GMT, Tengfei Fan wrote:
> QCS9100 uses EMAC version 4, add the relevant defines, rename the
> has_emac3 switch to has_emac_ge_3 (has emac greater-or-equal than 3)
> and add the new compatible.

This blurb isn't capturing what's done in this change, please make it
reflect the patch.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
