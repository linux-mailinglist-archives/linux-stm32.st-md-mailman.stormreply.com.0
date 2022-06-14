Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0DE54AE94
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jun 2022 12:40:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88431C6046A;
	Tue, 14 Jun 2022 10:40:39 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D4E1C0D2C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jun 2022 10:40:38 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id m24so10640281wrb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jun 2022 03:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:from:to:cc:subject:references:mime-version
 :content-disposition:in-reply-to;
 bh=BJB3Jj+W5NRHZEZPtOT6087E76LkDf+KkklgOlWVWzg=;
 b=Vx9jgtkwFhdUaWrGkqkzajXjR7Jmjk7cSeF52w5i5LknZZbrFOqcOkF7qZRpf/ga3x
 d4GtXKlDEaZ6mXMxClErNdgkth+XYPu0uG4P+rJYx9ylxK0o7iQLa8gOlrfTHjmi98j4
 Wh3H5GjFpxFsh9e16Xkmk89ceigDXefdv+XRR5mutiF6b4UrUZRWW2zO+CT9U2c24EoI
 Vj0q8tsyTfqWc6bBlRA8OXESzZXZR9iOzujRPJeEmNxr9w8h3N1uQh/li+mOiQ52xxAb
 A9rzOsVoaRmihLMnVqP4J5eu+vcoqxX9S6jVuIU8jRwG6CQ4TC1M5mJuwHKBkQHjVQzm
 A97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:from:to:cc:subject:references
 :mime-version:content-disposition:in-reply-to;
 bh=BJB3Jj+W5NRHZEZPtOT6087E76LkDf+KkklgOlWVWzg=;
 b=TVNx0JGmmHrbBAxcqbsHLmsI8J48ae6vu81NbCeWw9bnkegfQrLaacgevNjRqLVflG
 KNExDwahhPbMwVHGKigPQXJWy6DGdIz67AhP9C7euUvVDF1/ZyURf/ML7RK0qv0iMTUj
 f6AVB6gII2ux6AJbDPd5/gmdBxCT3m9+unRqwLfRpbJpOIrjM04GVtZ8kZ0YF+z9vr1V
 yJ9Bfaj55YT0Zr0qOMbyd2bqTmZx0x/la7VekzCdCS48A7qt7VzcDxsVLhn6dLoz7uXE
 c52wghrB2r9EoKeHxPIsBT0tt1rrFAVapP0sVreLEOCWFdiNWGXsQRl3RmrEeiC/qjZS
 azeA==
X-Gm-Message-State: AJIora+UEYWDDvugz7bGUpG/hOIndB7pLABm2PEgXS32l9homgJSQeMx
 fxlpnIs/qg6SzVFjhpGlPS8=
X-Google-Smtp-Source: AGRyM1uoZWrC1W/k512tGAzARKScdtlh9G+N0yFoFFFZiLcqKJi4jpBJsGpSKHqWRKl+/5ViIFOUHg==
X-Received: by 2002:a05:6000:1866:b0:218:40cc:a26e with SMTP id
 d6-20020a056000186600b0021840cca26emr4270476wri.678.1655203237290; 
 Tue, 14 Jun 2022 03:40:37 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
 by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c154600b0039c5ab7167dsm18006041wmg.48.2022.06.14.03.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 03:40:36 -0700 (PDT)
Message-ID: <62a865a4.1c69fb81.81506.21c5@mx.google.com>
X-Google-Original-Message-ID: <Yqhlo8WayYq+68ex@Ansuel-xps.>
Date: Tue, 14 Jun 2022 12:40:35 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
References: <20220609002831.24236-1-ansuelsmth@gmail.com>
 <20220609002831.24236-2-ansuelsmth@gmail.com>
 <20220613224917.325aca0a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220613224917.325aca0a@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mark Mentovai <mark@moxienet.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH 2/2] net: ethernet: stmmac: reset
 force speed bit for ipq806x
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

On Mon, Jun 13, 2022 at 10:49:17PM -0700, Jakub Kicinski wrote:
> On Thu,  9 Jun 2022 02:28:31 +0200 Christian 'Ansuel' Marangi wrote:
> > +	dn = of_get_child_by_name(pdev->dev.of_node, "fixed-link");
> > +	ret = of_property_read_u32(dn, "speed", &link_speed);
> > +	if (ret) {
> > +		dev_err(dev, "found fixed-link node with no speed");
> > +		return ret;
> 
> Doesn't this return potentially leak the reference on dn?
> You move the of_node_put() right before the if (ret) {
>

Totally right. Will fix in v2.

> > +	}
> > +
> > +	of_node_put(dn);

-- 
	Ansuel
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
