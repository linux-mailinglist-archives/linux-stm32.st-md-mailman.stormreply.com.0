Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9780BD1BA8
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2019 00:26:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59CEDC36B0C;
	Wed,  9 Oct 2019 22:26:35 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56570C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 22:26:34 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id r5so5852917qtd.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 09 Oct 2019 15:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=CiNtf9aBIrrX5eeY+lWUtp3cirNfSmpXQ9FltiktAv8=;
 b=FifhUGIjpae34or/omxVvVhF4rTt/qglBiIOmZrJKECnjR1gVHZsl8LD6YgHFKTCXk
 hCZnog3cO2un3XkGVataAVPc30evbmMui325U5Rp6eS6XapsDteXGLN6FhKqGctsV2ao
 Mx5Ef0I0DwwIRgRslVWXqZydwnLF4QJibAxyqWnlvJgXenZgySzhiKYKJ2uae0g4NoWq
 alJLKjeJwSPpS3TJfgbwb9lEEdUq51XdBXR6eLtEthEIroRTCUZMZeqzJ967zjwYCcUi
 FBTwZhcbcy1YP3GF59x/oZdm0LstQNmyJKF1+4jueJ4vBmMxQkuLHpXREbEd1e/VGs0B
 wX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=CiNtf9aBIrrX5eeY+lWUtp3cirNfSmpXQ9FltiktAv8=;
 b=c/vWnz6LNX+RB69W+xIBb8ByTXd72nBxJtefbezbeqgjctBNY6cfkVxbUGtlcBsVBD
 /hwDboWlRax6GkalESoowo19ggAje/+1fBV57sXbsOE+6+B03u8KJicPHzOQJ24y/tie
 U2B4t/2v2hO+V9G7EJEDJm4BHNrnhYiTQvg5jubCn4V8P2OkfWoXxJw+lV8yJXCRoDYP
 FzW+aojlA4A3hSMtN7Po8tcEvG04eS1mkGfWZmjYif5XPIEz+KLunA5NmocU9sOa5DEc
 GHs3w1my9VCLL/F3oJMrME8iVMxbqb5oVYKVmD8FdQxRkvixb7AipJ2OTu/kfD4eOgdF
 i0dQ==
X-Gm-Message-State: APjAAAUc274a471JU/SubMEPy7x2CgIpoLAL6CV3dutkXOdaCidyYlvn
 xVCaylbL/lfzibyzdKWa6m3iGQ==
X-Google-Smtp-Source: APXvYqy0slX/EioTfIAvk6LMnCaI+bB5mkLKuNgrupgqFoZCuC6hMmDIMoLJbc3HFKkDgCKbzceKzA==
X-Received: by 2002:a05:6214:1264:: with SMTP id
 r4mr6460857qvv.64.1570659993075; 
 Wed, 09 Oct 2019 15:26:33 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id k54sm2393829qtf.28.2019.10.09.15.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 15:26:32 -0700 (PDT)
Date: Wed, 9 Oct 2019 15:26:18 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Antonio Borneo <antonio.borneo@st.com>
Message-ID: <20191009152618.33b45c2d@cakuba.netronome.com>
In-Reply-To: <20191007154306.95827-5-antonio.borneo@st.com>
References: <20191007154306.95827-1-antonio.borneo@st.com>
 <20191007154306.95827-5-antonio.borneo@st.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: add flexible PPS to dwmac
	4.10a
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

On Mon, 7 Oct 2019 17:43:06 +0200, Antonio Borneo wrote:
> All the registers and the functionalities used in the callback
> dwmac5_flex_pps_config() are common between dwmac 4.10a [1] and
> 5.00a [2].
> 
> Reuse the same callback for dwmac 4.10a too.
> 
> Tested on STM32MP15x, based on dwmac 4.10a.
> 
> [1] DWC Ethernet QoS Databook 4.10a October 2014
> [2] DWC Ethernet QoS Databook 5.00a September 2017
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@st.com>

Applied to net-next.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
