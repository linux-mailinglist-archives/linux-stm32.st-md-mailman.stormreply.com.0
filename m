Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CDF48B462
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jan 2022 18:50:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69D32C5F1F5;
	Tue, 11 Jan 2022 17:50:05 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF0C4C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jan 2022 17:50:03 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 s21-20020a05683004d500b0058f585672efso19467909otd.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jan 2022 09:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SjRe+CkmRLZrog3sEydSnGtCTplRZpNfb1EM1oGQgQ4=;
 b=yt/mob3uNC89uzrtPy7HxstkimQTdsbAVZjs05RMPOSyMlgjFiDAX8gv6WSQZvcxJx
 2/tSo4BwrrMg0377eIIzuU9gSDSzl7K81piyXtRbcPOBb/LmrnyVMRyjIxzQB9PqpERe
 yopfjDqcHHARBFeghOXKqCywSYmA30MLC8+1BZYVlcUUWsA2NmpGEAfc1XoalwGT0p5Z
 p9JbMku1zsm+rqwkNCgHlfscBiuNrbCIkPkN+mkEOdtv0I5qV2nKS/22p2LKc74HvIJM
 ko8Vn0L3pfFjYoRrHitnKlm+iGOe+ty60PO/0m8d8M1gzTDH9HpKleupXw6UeKPN/q2Q
 i6rw==
X-Gm-Message-State: AOAM53381rrybH3ZNZocTgQM2FS/qstXJIBeiM+SVxSdKb8yKRTXtU5F
 /n3e8Cg2tkRY4UNqF7Q7TQ==
X-Google-Smtp-Source: ABdhPJyvAbTpnK0keT5SZM33hy+udbBcmUmItmHAKcPEBi3qTSizv2gbfjVZO6wX/A1GeVzkHYMZJg==
X-Received: by 2002:a05:6830:4127:: with SMTP id
 w39mr4058250ott.98.1641923402686; 
 Tue, 11 Jan 2022 09:50:02 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id z30sm2156546otj.1.2022.01.11.09.50.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:50:02 -0800 (PST)
Received: (nullmailer pid 3225637 invoked by uid 1000);
 Tue, 11 Jan 2022 17:50:01 -0000
Date: Tue, 11 Jan 2022 11:50:01 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <Yd3DSb6gJLgIcjxG@robh.at.kernel.org>
References: <20220106182518.1435497-8-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106182518.1435497-8-robh@kernel.org>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: net: stm32-dwmac: Make each
 example a separate entry
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

On Thu, 06 Jan 2022 12:25:16 -0600, Rob Herring wrote:
> Each independent example should be a separate entry. This allows for
> 'interrupts' to have different cell sizes.
> 
> The first example also has a phandle in 'interrupts', so drop the phandle.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
