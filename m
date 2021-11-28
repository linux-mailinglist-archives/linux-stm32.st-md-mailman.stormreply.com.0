Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F884460B50
	for <lists+linux-stm32@lfdr.de>; Mon, 29 Nov 2021 00:59:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA6BBC57B6F;
	Sun, 28 Nov 2021 23:59:51 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB76DC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Nov 2021 23:59:50 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id q25so31299207oiw.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Nov 2021 15:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HkopmSmImQ8w6mneEpJv7+5TiqS3kp9uVIPZgZsG7ps=;
 b=m2oWn+kjVeNc+E+LmwcuwS72pddsFneG7q4l0/UZB22iflRbWTrXLmuj+f+bnl8eIk
 4HCE7oysMVbgXDrFSuLGMKvSh/Fm4O81Drbf1CRaE/gh0a+oEuhPqy+Ulc1J5XQZP82o
 B28lJXfYY4MLY91vldca8pp3J+N9aQCZaXnlYvWvII2k5OBZDLTZv2i370ljfYrd+x7B
 WkfbGMuV7GVYfmasmiUQeDXXbQas7JMyv+9/SgQm6BUU7WWKUCDToGvzfPm8kvc2PTDb
 K74En2qgcGVVQIQpdeMH1oWIZ1kWZYWAZ+/BgawWwGNzOoPwcHlTn7TvWKW6OGHxFWog
 2i+w==
X-Gm-Message-State: AOAM532pAPH1oCbyu5PXXG82Zv18J+v6btpeVPSSO1nWw1Z3WEvbMmjF
 i0Q+UfaWnBiudj2BSjzwyw==
X-Google-Smtp-Source: ABdhPJymWGC3cRGmk+z8SQTahYVCKdbAjCOPFeTlz8NYWGEtEd6izZ2utwiI4HU88YCnD1tXXW8siw==
X-Received: by 2002:aca:1b08:: with SMTP id b8mr36306600oib.148.1638143989603; 
 Sun, 28 Nov 2021 15:59:49 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:5fe7:4487:d1b1:985f:1f68:141e])
 by smtp.gmail.com with ESMTPSA id
 j5sm2077075oou.23.2021.11.28.15.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 15:59:48 -0800 (PST)
Received: (nullmailer pid 2843741 invoked by uid 1000);
 Sun, 28 Nov 2021 23:57:41 -0000
Date: Sun, 28 Nov 2021 17:57:41 -0600
From: Rob Herring <robh@kernel.org>
To: Biao Huang <biao.huang@mediatek.com>
Message-ID: <YaQXdaXzJ3LD7ab2@robh.at.kernel.org>
References: <20211112093918.11061-1-biao.huang@mediatek.com>
 <20211112093918.11061-5-biao.huang@mediatek.com>
 <04051f18-a955-9397-d94e-0c61fc8f595b@gmail.com>
 <5f6fec21ef9f2bca6007283b37e35301cfe745ed.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f6fec21ef9f2bca6007283b37e35301cfe745ed.camel@mediatek.com>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 dkirjanov@suse.de, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH v3 4/7] net-next: dt-bindings: dwmac:
 Convert mediatek-dwmac to DT schema
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

On Thu, Nov 18, 2021 at 11:09:55AM +0800, Biao Huang wrote:
> Dear Matthias,
> 	Agree, converting and changes should be seperated.
> 
> 	There are some changes in the driver, but mediatek-dwmac.txt
> 	
> is not updated for a long time, and is not accurate enough.
> 
> 	So this patch is more like a new yaml replace the old txt,
> 	than a word-to-word converting.
> 
> 	
> Anyway, only 3 little changes compare to old mediate-dwmac.txt, 	others
> almost keep the same:
> 	1. compatible " const: snps,dwmac-4.20"
> 	2. delete "snps,reset-active-low;" in example, since driver
> remove this property long ago.
> 	3. add "snps,reset-delays-us = <0 10000 10000>;" in example, 
> 
> 	Should I split this patch? 
> 	If yes, I'll split in next send.
> 	Thanks.

It's fine with one patch, but describe the changes in the commit msg.

Rob

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
