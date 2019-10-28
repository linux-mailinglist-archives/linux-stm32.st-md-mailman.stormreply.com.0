Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C30E1E78A0
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Oct 2019 19:39:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83991C36B0B;
	Mon, 28 Oct 2019 18:39:53 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 154DAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2019 18:39:51 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id v4so7469418pff.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2019 11:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=EPGX6h0pVC2AQtOu5m7E/AGIWcsdvwzFhVXR+bw0YPI=;
 b=WtWd6Dgb2y0Z+g6LWuXRgzS1P9sJCnOwh1VvFizsdI+7W3suTxXpcGNb81ZZ+5LMk2
 x8qrkDaMxlhIejJeLtF1R1fcB71CjSa7I813VsrGbFKWPcDYKhnKomSvWpjwAXhgqjQe
 EPsJIkvRrs414WdtjSTW9N6YS74cbmaiX78kXAdFDDxp5WEeTYc8ZhtcqJesxrDmbTGW
 jzz/BzKidHWunlJupB7VqzjIZEJ3SYTLI/kdLpMMubi65up5s3Py1VqROsCw2FdEwD+8
 riKg7SF2u2UUuhxWQdLqv545ih+6//TeYevrsoMEEpDg3laO/jfIo8SED/eqGuVe2UEi
 EaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=EPGX6h0pVC2AQtOu5m7E/AGIWcsdvwzFhVXR+bw0YPI=;
 b=q028CQQY8th3fPaCHkRBj2w4sYbYj6h2e2IF0sSgUKOS5PKqRQ50fY3bpW0Slbk5K4
 QXyMMKEkd7zDHtnkSgvpsOowHfln9yFHxPCCYDGxQ7nUHNUfiDcsq6ptd5bW5wAvfHIE
 kRHsQiMq79UVSLyOjsh41SK/5B2qDwxpFCj71PvtGxxHLN1hVoYEziXptvo5Ic/AkGtS
 1XuJVvDQ0qUBdp26AzVwHGSGLQK/skWs/QG0Wz8RoV04CItD8HjQ8swbLO+L+YznSUJj
 ngPrBS3RZ/vOVgS0aI7Xa7NuFWMZhYyNRUlkAOs62/hfRh1YA0ZF5WuXBo8MdoU7+2bx
 oOAg==
X-Gm-Message-State: APjAAAXaEih7RtC8gCo56vllHaQLSN1VWw1erDdrGhbSfYY4pcR6uUdf
 ylLn4SrBcWWNUWHF6UFoqvSC9Q==
X-Google-Smtp-Source: APXvYqxmfepHhI74vqfOzXZ2oM4YuZcr3aFLhwrDPxJZ6ggCv/6HfLvAYpIaC1rg8h+fqYAl/REmIA==
X-Received: by 2002:a17:90a:d793:: with SMTP id
 z19mr927832pju.17.1572287990242; 
 Mon, 28 Oct 2019 11:39:50 -0700 (PDT)
Received: from cakuba.hsd1.ca.comcast.net ([66.60.152.14])
 by smtp.gmail.com with ESMTPSA id h8sm559228pjp.1.2019.10.28.11.39.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 11:39:49 -0700 (PDT)
Date: Mon, 28 Oct 2019 11:39:46 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Christophe ROULLIER <christophe.roullier@st.com>
Message-ID: <20191028113946.64dc0835@cakuba.hsd1.ca.comcast.net>
In-Reply-To: <085bdbc4-4845-a3ae-d8f3-bf4f2d753226@st.com>
References: <20190920053817.13754-1-christophe.roullier@st.com>
 <20190922151257.51173d89@cakuba.netronome.com>
 <1d5dfc73-73e1-fe47-d1f6-9c24f9e5e532@st.com>
 <085bdbc4-4845-a3ae-d8f3-bf4f2d753226@st.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"  <netdev@vger.kernel.org>, "@stm-ict-prod-mailman-01.stormreply.prv,
	andrew@lunn.ch,
	"  <devicetree@vger.kernel.org>, " linux-arm-kernel@lists.infradead."org," <andrew@lunn.ch>,
	"joabreu@synopsys.com" <joabreu@synopsys.com>,
	"mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
	"  <linux-kernel@vger.kernel.org>, "@stm-ict-prod-mailman-01.stormreply.prv,
	devicetree@vger.kernel.org, Peppe CAVALLARO <peppe.cavallaro@st.com>,
	"       <linux-arm-kernel@lists.infradead.org>, "@stm-ict-prod-mailman-01.stormreply.prv,
	netdev@vger.kernel.org, "davem@davemloft.net" <davem@davemloft.net>,
	"linux-stm32@st-md-mailman.stormreply.com\"          <linux-stm32@st-md-mailman.stormreply.com>, "@stm-ict-prod-mailman-01.stormreply.prv,
	linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/5] net: ethernet: stmmac: some fixes and
	optimization
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

On Fri, 25 Oct 2019 09:17:52 +0000, Christophe ROULLIER wrote:
> Hi all,
> 
> Just a "gentleman ping" about this series

Please add Alexandre's acks and repost the series. Since net-next is
now open it can be applied.

Due to the volume of changes that go into the networking tree, Dave
doesn't keep track of patches "for later". Patches which couldn't be
applied for process reasons, or due to conflicts, or missing
dependencies have to be reposted once the obstacles are removed.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
