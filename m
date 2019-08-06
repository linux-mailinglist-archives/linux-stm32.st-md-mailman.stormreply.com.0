Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 751C682A69
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Aug 2019 06:34:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1998FC35E03;
	Tue,  6 Aug 2019 04:34:53 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3178C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2019 04:34:51 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id r1so40762661pfq.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Aug 2019 21:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=37e73pgeUst/e32No0I5VlF96GbX2bnFea6wHE9lo0U=;
 b=1fb8tsw+IDfyYebA8NHR9PDMJAuQesOzz/4+8c6F3puynzPajSonryQyPh0Kuobou9
 vyzPLWjKg2Fx4Z/XCdhQBxhV15xnBVPYb5qyzq3gF4MyDhFnA8n4OIB/E1FPhX841kIl
 ZZRI4i5Yr7S2qvgCkRnCrH+lNfb/9gZOK2yiFoFwhuakHZs3bcsjDdamB7yiOqXLD2l1
 ITwCcZ31Ka5Fyw1tDzbF7JZkncEq4tjxcR9LPjGPdKpouDu0By6wTdr7c64bk8a23cV/
 C/IGopUF0QO5fDkgNxiaS7O1q7YW+qU8yiDbLTEY5N5c805gudzKLpmeZV1jWfH5OmEx
 ni/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=37e73pgeUst/e32No0I5VlF96GbX2bnFea6wHE9lo0U=;
 b=HzaIrkBVj5+6wvPttHwJmhai1PZ6FVDmPrFNVxSL/osOrnj4xQyRzSzjGcz5+YfI9F
 OwGSox8FeUXYC0iLFFybto29mNEsV4l68IvA+MrMmdVBIKH+M0R1C4HpJ14HMpxeCwJ0
 ujEVhxJKB3QqmGKyCOsqWsZ77O1Jxj58GdKpHjynu5LWnpAxg+z2Lab4t3jff4pMzKqT
 1TLeBkuwxXZ+SKFN9DCoQZuG5gQFhUSFZ2aACf//GxVNdHWrd3FlzGTI6A6xlUkXR3Vw
 vVT8CwJ9L8hzb/HUtkHyq1YgMjbjTHekeVXYini628/LJrG7v+3sXSgQRC37VHOF8Wjn
 ktfA==
X-Gm-Message-State: APjAAAWFZQYV7fsVA8zNMutTBpo2cqszeyZHSCGq4h6ExzVkxtz6/7td
 nlME/ao8eCaUYvRADsiv9K2A0w==
X-Google-Smtp-Source: APXvYqxSbFtO3Q8AmtiweeWMVTX404S5ZZBWpaWkpDDNXsVITjS2rpZBN1xFskUAblQd3Ye+zshvsQ==
X-Received: by 2002:aa7:9513:: with SMTP id b19mr1660078pfp.30.1565066090291; 
 Mon, 05 Aug 2019 21:34:50 -0700 (PDT)
Received: from cakuba.netronome.com (c-71-204-185-212.hsd1.ca.comcast.net.
 [71.204.185.212])
 by smtp.gmail.com with ESMTPSA id 10sm104956416pfb.30.2019.08.05.21.34.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 21:34:49 -0700 (PDT)
Date: Mon, 5 Aug 2019 21:34:25 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <20190805213425.3fce1d42@cakuba.netronome.com>
In-Reply-To: <5e95bb1761f9438361f198d744640685a34790ea.1565027782.git.joabreu@synopsys.com>
References: <cover.1565027782.git.joabreu@synopsys.com>
 <5e95bb1761f9438361f198d744640685a34790ea.1565027782.git.joabreu@synopsys.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 03/10] net: stmmac: Fix issues
 when number of Queues >= 4
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

On Mon,  5 Aug 2019 20:01:16 +0200, Jose Abreu wrote:
> When queues >= 4 we use different registers but we were not subtracting
> the offset of 4. Fix this.
> 
> Found out by Coverity.
> 
> Signed-off-by: Jose Abreu <joabreu@synopsys.com>

Should this be a bug fix for the net tree?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
