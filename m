Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6380D288697
	for <lists+linux-stm32@lfdr.de>; Fri,  9 Oct 2020 12:12:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11975C32EA8;
	Fri,  9 Oct 2020 10:12:48 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DD792C32EA6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Oct 2020 10:12:44 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id a3so12226158ejy.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Oct 2020 03:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Pu6uFYl5g3lWcF1Rf0VrnUrLJTa6VGuUqdl8E16TQmI=;
 b=JIxKJHC35w3/PF+7f04UAQOW8ZrXMCY89C4aZn0BU9wOCIWohsh5nFBNPbceAsv575
 NUTUL6jIkD5JaokEejtHZPzRyCgHo77espaNNIsydVTc29T1Osv0+ZLqfKyny7E717t+
 taqqYZylTX9LbGRW1tSCmHk/wOJBEvzEl4Prdq2hWQf05uB4Gs3Mivn22QdyVZNSO7IF
 k4ruanWe3DRCjzlRhHytK+RMOHhvKc9O+Q5rrbcWN7M5b2pFb8g1Rbh3BQ1BmSvl4eQg
 YlDL6b9DJso2CKzuotE7JFYusQbJ/BDFRzf5/n/FtO6l6RM+Bt+sQea7vgWhM8lJpjLs
 1uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pu6uFYl5g3lWcF1Rf0VrnUrLJTa6VGuUqdl8E16TQmI=;
 b=Xt+Vhs4LP5o/6hmrpkpD9ZUYXuRAjZp/wGuBnHim5TZeJxzGhBgins2WDpyftQ8uvw
 c6plUUR3Z44GfCquLWd1VdVKUPzAyV5pzUpzlqXD4VxWWmdakhXrBV42cY8Ps+K+FCfh
 fh7xkNrqRINpmfj1i68hoNDodd202w8BUppBq/fOG8GkgI/F+zz8ZB9mXsFqTnsgbZhO
 6chNCU0sw6MblIG1KpuXtPLxzKAmbNOB8nii0d2qgitelsyIct4gsaDRd68mf7+pr/08
 gT983v8hKf/s+LI4pk/DWCMQtwQmDQX1M17/Tykvja/ffqCrH91pTEepF48wFGGdTpoH
 gdNw==
X-Gm-Message-State: AOAM53175atDJw8bIYiA9BIXwo/juehSoeTmN9r/HSk+EyZMJXYIVibx
 a0T+tCqMAWN/T5ui40xJZgM=
X-Google-Smtp-Source: ABdhPJxp66T3ofOaQiKnvkErLduT7emZPOyZINsZU/nAVBl8G5RKHaZy40JF3sEcWbbrqCq6CWTBcg==
X-Received: by 2002:a17:906:bc91:: with SMTP id
 lv17mr13978607ejb.249.1602238364034; 
 Fri, 09 Oct 2020 03:12:44 -0700 (PDT)
Received: from skbuf ([188.26.229.171])
 by smtp.gmail.com with ESMTPSA id n22sm6012278eji.106.2020.10.09.03.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 03:12:43 -0700 (PDT)
Date: Fri, 9 Oct 2020 13:12:41 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: John Keeping <john@metanate.com>
Message-ID: <20201009101241.qr6blbfyamtuzrwy@skbuf>
References: <20201008162749.860521-1-john@metanate.com>
 <20201008234609.x3iy65g445hmmt73@skbuf>
 <20201009105945.432de706.john@metanate.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009105945.432de706.john@metanate.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Don't call _irqoff() with
	hardirqs enabled
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

On Fri, Oct 09, 2020 at 10:59:45AM +0100, John Keeping wrote:
> No, it's not, although I would have saved several days debugging if it
> was!  I backported the lockdep warning to prove that it caught this
> issue.
>
> The evidence it is possible to see on vanilla 5.4.x is:
>
> 	$ trace-cmd report -l
> 	irq/43-e-280     0....2    74.017658: softirq_raise:        vec=3 [action=NET_RX]
>
> Note the missing "d" where this should be "0d...2" to indicate hardirqs
> disabled.

Cool, makes sense.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
