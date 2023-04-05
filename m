Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C286D8677
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Apr 2023 21:02:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28DBAC6A60A;
	Wed,  5 Apr 2023 19:02:29 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1864C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Apr 2023 19:02:26 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-17fcc07d6c4so25581042fac.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 05 Apr 2023 12:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680721345;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=iuciwAKZq2wJaT34pYXM66kr946sug+R1OznahFQbBs=;
 b=GAaUYpEiV2Kl47BwmEhK7xVfJjJTlt1T3xzYge0UObeFDVpYOjI0mLsM/96CR/75Uc
 iAEBzvLXK+sjUt+RJE2HG2iwOdLyHf9CpZt0CBsXeSf2Qqlhh/9+X5beAFjasahU1wX/
 oObcb/d5krd9URFx9g8a2dHqSBA0f+Ix6GQFiiCm3thks0rqvXSdejTrYQpXHsq+J/5W
 0cFgPVpH5cH3vo+70IBd3XztFas+fmbAYFRowEpJrzKLEc2eKmgsUcQJ6q5Fpy7ORqGd
 QdHOQ/AhhH002MRxqQewW5fEdMX+519Q15s1l4G4CYGmgmi+thNCRLkBYiByR5ruIgmG
 3TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680721345;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iuciwAKZq2wJaT34pYXM66kr946sug+R1OznahFQbBs=;
 b=Tpr6AC4Yqyyrcqx4ZaHWcSIbohqLlXksM3t/TJrMU4TSNiXcWVfnou9v+7f4gUja9Z
 Q/3uMmMsQJZeJ8vbZHIwpSI8GCgPFV9+F5lJFOd0+VYwZC2XHbM7iJqbelZsCn9qAzcl
 KbnmlyFCnl462N2FFVqKujS1kot2LcX/5fO9rmOZWEYdHhIfgFZ3Uvcwi6C8nEKcjyde
 bsBzpF6+/wG2XdUl3oDhpoOGmasWtr0YDqgwgpT/2r8dWQvEQYt0U+ooXVoL1yJuzNQc
 03A+/MEfgkHOePlo/brboW39LuiAK29DoAHRyO8Cz3sEFwiTEUN5Y4NH1B0rxM6WxpP5
 CW4g==
X-Gm-Message-State: AAQBX9fhsymbhbDdOKCYtphWwz9wfkgSVEP2Cql6Oil0FhMH3Uw1Gz24
 EaA8fuAX/ahOcSuzf0sY4To=
X-Google-Smtp-Source: AKy350ZG/6KmGrQcmR25Tx+lgzJ67Tk0y/et/MTnFdphXiBVmC6K7HCCleCmK9YphFfExyB962br7w==
X-Received: by 2002:a05:6870:41c8:b0:17a:a4af:8e3e with SMTP id
 z8-20020a05687041c800b0017aa4af8e3emr3874842oac.47.1680721345603; 
 Wed, 05 Apr 2023 12:02:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 zq42-20020a0568718eaa00b0016b0369f08fsm6214199oab.15.2023.04.05.12.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 12:02:24 -0700 (PDT)
Date: Wed, 5 Apr 2023 12:02:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Message-ID: <d942f8ac-3a60-4a71-8cd5-4f2f7aeaa2bd@roeck-us.net>
References: <20230405093945.3549491-1-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405093945.3549491-1-michael.wei.hong.sit@intel.com>
Cc: andrew@lunn.ch, Voon Weifeng <weifeng.voon@intel.com>,
 Lai Peter Jun Ann <peter.jun.ann.lai@intel.com>,
 Eric Dumazet <edumazet@google.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Marek Szyprowski <m.szyprowski@samsung.com>, hock.leong.kweh@intel.com,
 linux@armlinux.org.uk, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 Looi Hong Aun <hong.aun.looi@intel.com>, Tan Tee Min <tee.min.tan@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Zulkifli Muhammad Husaini <muhammad.husaini.zulkifli@intel.com>,
 "David S . Miller" <davem@davemloft.net>, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: check fwnode for phy
 device before scanning for phy
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

On Wed, Apr 05, 2023 at 05:39:45PM +0800, Michael Sit Wei Hong wrote:
> Some DT devices already have phy device configured in the DT/ACPI.
> Current implementation scans for a phy unconditionally even though
> there is a phy listed in the DT/ACPI and already attached.
> 
> We should check the fwnode if there is any phy device listed in
> fwnode and decide whether to scan for a phy to attach to.y
> 
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Fixes: fe2cfbc96803 ("net: stmmac: check if MAC needs to attach to a PHY")
> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> Tested-by: Shahab Vahedi <shahab@synopsys.com>
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Tested-by: Marek Szyprowski

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
