Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BFEBABDD
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Sep 2019 00:13:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F947C35E01;
	Sun, 22 Sep 2019 22:13:04 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20794C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Sep 2019 22:13:02 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y22so7866963pfr.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 Sep 2019 15:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=PmAznyfs4k+mWd//xBrPme3TcumsUBoHQjEZq6u+NLY=;
 b=Q9CxQCZVN3CeKim3T14DI+dzH5PlCDTA8QmbsW+C8eax7IIA/NB0aFCLOE5uEMlnah
 n9HfkK054QH0pzmBa/MaaPHryLTCxiQvGwyx9m2DBJ3+fWXwG4tZ1JBoHBYs79JyChbx
 r5rFDF448s/NfZ2lrFLEI/35LniKtZVDGfAnyeOltNGUbu+hXauDlNLnNAaQqWncuzo2
 +3937Vc7WBUdbsp3LzrmK2ZIuYecnYyYnVMqeOVgiI0Tg/28mg73wkAS2nR2q0eakRY3
 9/YK/KVHUUOG6XAHJmFirHgZxtOEbFencrEJwS4yKpWhp/Wx/AxSLIA3VX7LS190gJnR
 PoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=PmAznyfs4k+mWd//xBrPme3TcumsUBoHQjEZq6u+NLY=;
 b=dZr7aBlKvkB1Su84iejyib2VEEdoSt7ejt8m6UyJsTBlWcjsHGtT9eoi+rtdDAikI8
 YF8FkTvtGni1lUJFyVIYaV715qEPOPkzyrcbGnGYPfnRxGZUdW6km0FB2p370+E6I9n8
 rnCa8RTOaQnns1x9vp0GCJWax6zviz8FyZJY67R3xAMNBeoBKEMr8Dw90Gpj5Z2sE2tf
 KBRU9Hv+Z0GMFjEwFjbWcBBJwL5WL4dxSzENnFkrjJtMaV45jpcfifK8sasiNwyPEU66
 mlXMPBAXk+7exgD3jZcGEb7kLrXkVCSMvZR1chyW2wrCFl3lqX7WSUKfPSqxzc28cIMx
 pY9g==
X-Gm-Message-State: APjAAAUKDwVISGZIltlJ4ph5xZX+BnMHMAsyawtRd2b2DhKn5bSds31h
 eFUhIeXpquo3xYpS/BzDgkKheA==
X-Google-Smtp-Source: APXvYqzciIn5+C8G7UZYhYgLD06dOmlQZq70XrUrVD2u2KT92kUx/KmLzyi/sFi09I3djSRu2p/rmQ==
X-Received: by 2002:a17:90a:8087:: with SMTP id
 c7mr17644769pjn.56.1569190380757; 
 Sun, 22 Sep 2019 15:13:00 -0700 (PDT)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id r187sm7877357pfc.105.2019.09.22.15.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2019 15:13:00 -0700 (PDT)
Date: Sun, 22 Sep 2019 15:12:57 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Christophe Roullier <christophe.roullier@st.com>
Message-ID: <20190922151257.51173d89@cakuba.netronome.com>
In-Reply-To: <20190920053817.13754-1-christophe.roullier@st.com>
References: <20190920053817.13754-1-christophe.roullier@st.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Cc: mark.rutland@arm.com, robh@kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, joabreu@synopsys.com, andrew@lunn.ch,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
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

On Fri, 20 Sep 2019 07:38:12 +0200, Christophe Roullier wrote:
> Some improvements (manage syscfg as optional clock, update slew rate of
> ETH_MDIO pin, Enable gating of the MAC TX clock during TX low-power mode)
> Fix warning build message when W=1

There seems to be some new features/cleanups (or improvements as
you say) here. Could you explain the negative impact not applying 
these changes will have? Patches 1 and 3 in particular.

net-next is now closed [1], and will reopen some time after the merge
window is over. For now we are only expecting fixes for the net tree.

Could you (a) provide stronger motivation these changes are fixes; or
(b) separate the fixes from improvements?

Thank you!

[1] https://www.kernel.org/doc/html/latest/networking/netdev-FAQ.html
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
