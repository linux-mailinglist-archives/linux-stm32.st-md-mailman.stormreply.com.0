Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF50A9ACC8
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 14:04:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05EB6C7802F;
	Thu, 24 Apr 2025 12:04:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F124BC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 12:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745496254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bh3s53lxnJJO2dUSgO66le/Ri+7+LskKQ0VlwKBl9JU=;
 b=hUWJkPQlxl1a5FPHlLKfiI7BAdPB0vZi9x7rVztM90JiRyWgzEDgNXLVe9s/Xx1AtE4iJU
 by2u2gcDNvThVfnPpA09vRwg30q1hlzqyOX+qnzOAc0cBw8pIGjJdbVDvSkW5c3JTMOEeE
 8JLeA+VoGi3pwBhrPnnhl7de1DEoKAM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-7uBXP1p9MAuS68iVkwy3IA-1; Thu, 24 Apr 2025 08:04:13 -0400
X-MC-Unique: 7uBXP1p9MAuS68iVkwy3IA-1
X-Mimecast-MFC-AGG-ID: 7uBXP1p9MAuS68iVkwy3IA_1745496252
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-39134c762ebso322219f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 05:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745496252; x=1746101052;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bh3s53lxnJJO2dUSgO66le/Ri+7+LskKQ0VlwKBl9JU=;
 b=IPOtIYbJ+W/coLlAV9x/CDScDhX8Sq3vc8Dxr+yuqhPEMlfO00wEN4bZoporQS8u5F
 SJ8MQDrnqW4DOvc1T1vMMq0vCS5KKReE6l6RLII2zvjY1iBapok2GcFT65wA/38evnXs
 835l95QJx6L/89PPrmUfVpeT5kPKImgkTmDjpEHTivvffsPQ0Vxy0KqOLmQ/06fjh8rZ
 VgmWwYbdRmgBae1qJTna657E8pNnaLa06LRfXSsuCNPLTi4rZGK/gn+L9MUyhj75v/E0
 yrBV1cA8WFosgAkbZfbBfGKRFQ8iRhkhQdttWIKxUAd1mwvONpNVY69Q78AakSbW8kJ6
 oh+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUl8trbdPsK1DRYrFKKxGdG6lnviQv5uPputiG0+kd5Bszw4cn+UnC5FvkT18y8/Tqr+catdfv5TdtdSA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxsYyGFqJWCEQFIE8eZpYeU/hCNeTywm4/Di3oSotPkWL5ufK5d
 xGybe6oonOdKGEw+9yQl7eI4949aM0p0INSTtXycPtqLAa7ptSzh4giRKbT98wme+l3mV5hBbXO
 oi11l0IxkukgJNoHkuIEJcIbpCiH+QxfdAGBB3WFF1NyK2Q7vnUUseVoRjWl18pa02ufKPtoACN
 8cRQ==
X-Gm-Gg: ASbGncv0KP/J1SeW9J23Ge9lweLcb1nsb5ahuCQk3Z1JLx6aPlxWa5waPjFxIikgE5/
 nE+kL2gT0VXRDfbbewM+FSNDLV8nCuEimeqmowetT0cN986I064WQheGX98hUPKiOB4ZRKXz94E
 2Tr9XFW9Ih4EKN3/v5JHAl9ndLMjtNqUpP8yrP25Oqex+tQdgKpKbw1cfeVKVQYWHBwGt4iGzIx
 5IM6AtN2oBL5xm4VHljpV2nG8CNhJAT5Kr6CTYFexkC3cuBBj1eTW6E9t/ovEcI0FHcEWAKo6Rq
 0KWnh7ImGAyk+rvp+BwfcpYUmx5jwJTbEt9A2VA=
X-Received: by 2002:a05:6000:178d:b0:39c:266c:423 with SMTP id
 ffacd0b85a97d-3a06cecb362mr1842806f8f.0.1745496251978; 
 Thu, 24 Apr 2025 05:04:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRZkkYGPeYcct/UGZCOBgEUQnsD5s94C5Hyp3c2PijFG72me2Lm433rHFIjvW+57vf1ZeXEA==
X-Received: by 2002:a05:6000:178d:b0:39c:266c:423 with SMTP id
 ffacd0b85a97d-3a06cecb362mr1842753f8f.0.1745496251410; 
 Thu, 24 Apr 2025 05:04:11 -0700 (PDT)
Received: from [192.168.88.253] (146-241-7-183.dyn.eolo.it. [146.241.7.183])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d4a8150sm1852436f8f.7.2025.04.24.05.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 05:04:10 -0700 (PDT)
Message-ID: <43ef6713-9ae1-468c-bc43-2c7e463e04f4@redhat.com>
Date: Thu, 24 Apr 2025 14:04:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Boon Khai Ng <boon.khai.ng@altera.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org
References: <20250421162930.10237-1-boon.khai.ng@altera.com>
 <20250421162930.10237-2-boon.khai.ng@altera.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250421162930.10237-2-boon.khai.ng@altera.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aLkuX20HjoMMUglsf3pvtUyNN2V6uE6FyDwBJd5jdQk_1745496252
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Furong Xu <0x1207@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 G Thomas Rohan <rohan.g.thomas@altera.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Mun Yew Tham <mun.yew.tham@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Tien Sung Ang <tien.sung.ang@altera.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v4 1/2] net: stmmac: Refactor
	VLAN implementation
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

On 4/21/25 6:29 PM, Boon Khai Ng wrote:
> Refactor VLAN implementation by moving common code for DWMAC4 and
> DWXGMAC IPs into a separate VLAN module. VLAN implementation for
> DWMAC4 and DWXGMAC differs only for CSR base address, the descriptor
> for the VLAN ID and VLAN VALID bit field.
> 
> The descriptor format for VLAN is not moved to the common code due
> to hardware-specific differences between DWMAC4 and DWXGMAC.
> 
> For the DWMAC4 IP, the Receive Normal Descriptor 0 (RDES0) is
> formatted as follows:
>     31                                                0
>       ------------------------ -----------------------
> RDES0| Inner VLAN TAG [31:16] | Outer VLAN TAG [15:0] |
>       ------------------------ -----------------------
> 
> For the DWXGMAC IP, the RDES0 format varies based on the
> Tunneled Frame bit (TNP):
> 
> a) For Non-Tunneled Frame (TNP=0)
> 
>     31                                                0
>       ------------------------ -----------------------
> RDES0| Inner VLAN TAG [31:16] | Outer VLAN TAG [15:0] |
>       ------------------------ -----------------------
> 
> b) For Tunneled Frame (TNP=1)
> 
>      31                   8 7                3 2      0
>       --------------------- ------------------ -------
> RDES0| VNID/VSID           | Reserved         | OL2L3 |
>       --------------------- ------------------ ------
> 
> The logic for handling tunneled frames is not yet implemented
> in the dwxgmac2_wrback_get_rx_vlan_tci() function. Therefore,
> it is prudent to maintain separate functions within their
> respective descriptor driver files
> (dwxgmac2_descs.c and dwmac4_descs.c).
> 
> Signed-off-by: Boon Khai Ng <boon.khai.ng@altera.com>
> Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>

This patch does IMHO too many things together, and should be split in
several ones, i.e.:
- just moving the code in a separate file
- rename functions and simbols.
- other random changes...

> -	ret = readl_poll_timeout(ioaddr + GMAC_VLAN_TAG, val,
> -				 !(val & GMAC_VLAN_TAG_CTRL_OB),
> -				 1000, 500000);
> -	if (ret) {
> -		netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> -		return -EBUSY;
> -	}

> +	for (i = 0; i < timeout; i++) {
> +		val = readl(ioaddr + VLAN_TAG);
> +		if (!(val & VLAN_TAG_CTRL_OB))
> +			return 0;
> +		udelay(1);
> +	}
> +
> +	netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> +
> +	return -EBUSY;

... like the above on (which looks unnecessary?!?)

/P

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
