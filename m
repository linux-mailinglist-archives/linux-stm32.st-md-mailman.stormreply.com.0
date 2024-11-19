Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 319B19D24AA
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 12:18:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0294C78F99;
	Tue, 19 Nov 2024 11:18:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E2397C78F98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 11:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732015090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WSBouoRatInqJbfUCy4gUiCHF5kDVST7sA6zTlqHn1A=;
 b=IwTp4ote9IueFqjdrOqb80yFNlFWNE3R/MdBi+Baga4oH+PXOF22U5lC6FaMH2IY4DEowY
 o7+3RiYKCOybspGmokhMBGYA0xQZDWKGaQ/Zle8JPF0vDv27PljrvIB/ruzFOrye4U623d
 CCo0KKx2KmSpzXOg2PbchL0FHH+41Io=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-QSb9UPFyPSW54Jhb3SD6Cw-1; Tue, 19 Nov 2024 06:18:08 -0500
X-MC-Unique: QSb9UPFyPSW54Jhb3SD6Cw-1
X-Mimecast-MFC-AGG-ID: QSb9UPFyPSW54Jhb3SD6Cw
Received: by mail-yb1-f200.google.com with SMTP id
 3f1490d57ef6-e388c4bd92bso4032670276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 03:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732015088; x=1732619888;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WSBouoRatInqJbfUCy4gUiCHF5kDVST7sA6zTlqHn1A=;
 b=ct+ZkudfVLy9YAxaZ0xnOpyhR5d5+2jY8TJriLlB8oJ8aReENhHlYCSTyg9D0OMmA8
 nCiTYdDJ3DYxO7VTRyQ3C40fIayoQhviYw9gQc0iDHX88JHd6t2IUWUyCJxLra6lPVUy
 uRhsIY48hHnE2ARpeD2ninyxkmkckxTVMIilOAuKlqIVYEMC2a672Oa7St/11zb1uqWD
 D318BR37KdRaTeTVbsX4gIg4V5MT/A8fqqiwdDZDyPPubaU7ifNSwWPFfV5+lVtQ0iD5
 QF9bkPl+kU7ccLqJq1/LKz6ljzmQ47MsG03TwAiteaPma+C0RmKDosTy3bFlR4+ru8gv
 56GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLT98AxIubOj8Dg3Z56MX1RvDDR3/B7ITUA2zoLKf4X27lerSddvmE1ENnrKIt/h9WsaWECsyhh2mt2w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxWeymrPmQl7IJt9oi3bwXoqAK2FXcw3XjK9CiTciVOGZYxH1xm
 CtMC3AZE9fj+Cxki7OAgoIBCsjy5iq6fCSqPLhSpRWJqdj7aLJ5B0+f7HAhtmnaUEXV9TSc1DoP
 FqGgdKTrm/X1HfNQPtCrLDYDbfpx5lSlMfFOaLQK+8zljIXYKRRMNpaPOv64fpqr6wy9g3MDMuJ
 jT+Q==
X-Received: by 2002:a05:6902:298a:b0:e30:cc00:b010 with SMTP id
 3f1490d57ef6-e382614f9c8mr10200276276.25.1732015088324; 
 Tue, 19 Nov 2024 03:18:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE96zkhRwyQeB2qy8231vJaIKfZPGcGVKna3QNScGbU8jvugvr7WKVQycq/NpiNX4wDg/wBiQ==
X-Received: by 2002:a05:6902:298a:b0:e30:cc00:b010 with SMTP id
 3f1490d57ef6-e382614f9c8mr10200247276.25.1732015088026; 
 Tue, 19 Nov 2024 03:18:08 -0800 (PST)
Received: from [192.168.1.14] (host-79-55-200-170.retail.telecomitalia.it.
 [79.55.200.170]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-46392c44142sm9845691cf.85.2024.11.19.03.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 03:18:07 -0800 (PST)
Message-ID: <3cfc2e90-c9b4-425d-80f4-ddace9aff021@redhat.com>
Date: Tue, 19 Nov 2024 12:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yijie Yang <quic_yijiyang@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241118-schema-v1-0-11b7c1583c0c@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BISsRPGIa4HQoiJ3IC5JJVGp1OIGT4Jin-r9cdeeiKo_1732015088
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: quic_jsuraj@quicinc.com, devicetree@vger.kernel.org,
 quic_tengfan@quicinc.com, netdev@vger.kernel.org, quic_tingweiz@quicinc.com,
 quic_jiegan@quicinc.com, linux-kernel@vger.kernel.org, quic_aiquny@quicinc.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, quic_jingyw@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] Add standalone ethernet MAC entries
	for qcs615
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

On 11/18/24 07:16, Yijie Yang wrote:
> Add separate EMAC entries for qcs615 since its core version is 2.3.1,
> compared to sm8150's 2.1.2.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
## Form letter - net-next-closed

The merge window for v6.13 has begun and net-next is closed for new
drivers, features, code refactoring and optimizations. We are currently
accepting bug fixes only.

Please repost when net-next reopens after Dec 2nd.

RFC patches sent for review only are welcome at any time.

See:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
