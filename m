Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA423DB025
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jul 2021 02:11:00 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E12B1C57B6F;
	Fri, 30 Jul 2021 00:10:59 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29A5FC57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jul 2021 00:10:56 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso18220780pjq.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jul 2021 17:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KvNrFVgss6eSO6kUoQ3VU0X35CeoRY7KVDc86f4fQm4=;
 b=kOZQR14Uy3g//5gbl3xlpGsDHTkZtnRt2eygeLvJGcHjKB5XzT7Ldokpq0NHg1qAFQ
 xrUuJh8cOjV96IFiAb3OEqVzDWXY9A9Iz4H+WomwEZv8pWvjbfnAGH/WBA0megaHfwAb
 FrZmi2FAWLjncp47tvP1GZz6eGYY3U0P/lCKl8QgOFdgFjhPely2k0UWryrc85QzoocQ
 nxpsUlu9rex7WQydEd8E2OP286Wjz5qgZt5sbHFjX6+q3MgLSpSZBwlrr445ZibTmdHB
 qMvuvtM3WGGw1NEYtucOdcPeFgMgOFEVG362GtLpgC47HKmy1NEok10Kr4JNtYkChDnx
 FZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KvNrFVgss6eSO6kUoQ3VU0X35CeoRY7KVDc86f4fQm4=;
 b=T03TaF0i+25gpJ6kytjC78vG2yohvlj3t0aDz9uHGu57dmqIwpCzw716wRMZe9z22j
 ZtYPpW8JX9y9rGu9uA3l2dVYc9XnQ6BQ+BnC/ZLLbSiY/kZjKoM8qDefKoPQjxxnw9og
 d+upujupQ2NtGWXrIdw43pDreTFZ6HKytCU2EB6u1/kMl1yza5g8BxVRt3MsGSS4Jjwj
 UVGm2Yf2fTn/9QtQlp6yfo4LW9Nf7emb+m1Ij6oqaNK+jSHd2kEqMGNSGN7+oWK9Q5xN
 rGJllTALEf3tx91cpAgmFKa7UJ60n31UiVQ23nZJ3NF1mOYl+RmTdrtbVv96zUJTJ3zy
 A00g==
X-Gm-Message-State: AOAM531I/s6ExTPJzzckT0PKpdCkZNQ2ISF+5++tWgghTtVslfvqQtf/
 r5RilpzUICnQg7TIiTeHSJc=
X-Google-Smtp-Source: ABdhPJwE/niSh5UdF+w0QQdfBSjFatj+JALFmIVOdTcLe3nO62DxPf2VNDgpH154QI9H1E+xrQvSqA==
X-Received: by 2002:a65:42c3:: with SMTP id l3mr698563pgp.377.1627603855087;
 Thu, 29 Jul 2021 17:10:55 -0700 (PDT)
Received: from [10.67.49.140] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id f15sm5154339pgv.92.2021.07.29.17.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 17:10:54 -0700 (PDT)
To: Daniel Walker <danielwa@cisco.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>
References: <20210729234443.1713722-1-danielwa@cisco.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <81fca68f-e0c4-ce02-6b2b-e5c22a0c3152@gmail.com>
Date: Thu, 29 Jul 2021 17:10:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729234443.1713722-1-danielwa@cisco.com>
Content-Language: en-US
Cc: Balamurugan Selvarajan <balamsel@cisco.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 xe-linux-external@cisco.com, Jakub Kicinski <kuba@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC-PATCH] net: stmmac: Add KR port support.
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

On 7/29/21 4:44 PM, Daniel Walker wrote:
> From: Balamurugan Selvarajan <balamsel@cisco.com>
> 
> For KR port the mii interface is a chip-to-chip
> interface without a mechanical connector. So PHY
> inits are not applicable. In this case MAC is
> configured to operate at forced speed(1000Mbps)
> and full duplex. Modified driver to accommodate
> PHY and NON-PHY mode.
> 
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Balamurugan Selvarajan <balamsel@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>

You are not adding KR support per-se, you are just hacking the driver so
it is happy with an unspecified phy_interface_t value and assuming
1000Mbits/sec, this is not going to work.

Just add KR/backplane properly or use a fixed-link property hardcoded
for 1000Mbits/sec and be done with it with no hacking, which would be
just way better than what is proposed here.
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
