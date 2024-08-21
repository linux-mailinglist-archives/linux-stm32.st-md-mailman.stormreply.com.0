Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D28D69597A3
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 12:27:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89E5EC6DD9A;
	Wed, 21 Aug 2024 10:27:38 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64C6AC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 10:27:31 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-5bece5b572eso95879a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 03:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724236051; x=1724840851;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/fb/RuJkeM3aFjdMF0c0Xwmg+kLLocjFSamrIW7BWhs=;
 b=KF+xI7pibxlMMRmky6OVr8ob5CaQtlPuM8Rf54QURGStPRnexmdFG2cnvnIeYGdPEC
 91M046XDaMKtYkfI55rC29Ci7ua1cPj0IKAb/alnGln2wniUMyjcJkIYjy78OSe5xPkG
 UoesadTWSBi2KwN1e+RebXmCSgjorgKvJF4f+XlGc23XBuD5ch+/wq1jOpwICiLFfhJM
 Z+e1tk2iUsHg+HIKzqpQX/4rvRF0/qxdgODI/B5RYAJcWBvPfsl5OskBWxQ9SVjgIQ53
 lU0xUf8NzC368puD4p9iNMcwhF7uSn8UA4uRhsSmCbHpnmmt8clPTRQQbDKr5PRORLXx
 E2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724236051; x=1724840851;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/fb/RuJkeM3aFjdMF0c0Xwmg+kLLocjFSamrIW7BWhs=;
 b=bmoHvqTBoPSczK2XLqxN4sxWriiAn+/1htrpbtiSDwMkSnVQLp2K4Fk66cqp7igBMt
 QZWo0oiGT2+c7IUD+6EfrMuC+QJCJcP5wikNV3xzJXu5CFhQGVBIArl5tGZ/Zs/4CAkq
 n3Go7l42C4B0Zw/tSf1IqtoIsG0ABGAIRoPtelzeD3TOPWKrpA73Xz+4qe5/yru908eD
 3lxOoRnzRXZMSZrX61Vy8UUC83WCp2mr0MFHfuGDn2QZXBfjT9oNuHpwYyvniYgEexDy
 mzGltAPqcyw7ktXyuOJrXAHjWMnYB/uWLKRqfqIImk1mZhxCu6We+A8OZCVPsi6vs2kt
 bfrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrtTubhDdrsU1m2uKVjArMOInNwztUOfrQTFTfJnRv/j1B0qAQOumF4+wSSitWd97IFXNXgUbQuWdTvw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxikbt3gfHkCEB97LRaWCbYaqRqPhrJ5reZpzY9n7qL5bbeLalW
 1Kxzas3VxlIaxo15fqCEkvzYV5pNx8fsv4vlSctbCbx1JU5pa4TR
X-Google-Smtp-Source: AGHT+IF6e53jlF1aQdWI+jcMWFq1gf/ZzPGVpqcc9Wop3GOkHdEj2yHM0jbnNyjDTQ4O5WbTWDngZg==
X-Received: by 2002:a05:6402:13c8:b0:5a0:d706:c1fe with SMTP id
 4fb4d7f45d1cf-5bf1f2abe3amr645381a12.6.1724236050235; 
 Wed, 21 Aug 2024 03:27:30 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5becf1f3442sm6465107a12.31.2024.08.21.03.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 03:27:29 -0700 (PDT)
Date: Wed, 21 Aug 2024 13:27:27 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Message-ID: <20240821102727.qitmm2zxnpva4cqd@skbuf>
References: <cover.1724145786.git.0x1207@gmail.com>
 <bc4940c244c7e261bb00c2f93e216e9d7a925ba6.1724145786.git.0x1207@gmail.com>
 <20240820123456.qbt4emjdjg5pouym@skbuf>
 <20240821125833.000010f7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240821125833.000010f7@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 3/7] net: stmmac: refactor FPE
 verification process
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

On Wed, Aug 21, 2024 at 12:58:33PM +0800, Furong Xu wrote:
> 
> Hi Vladimir
> 
> On Tue, 20 Aug 2024 15:34:56 +0300, Vladimir Oltean <olteanv@gmail.com> wrote:
> > I took the liberty of rewriting the fpe_task to a timer, and delete the
> > workqueue. Here is a completely untested patch, which at least is less
> > complex, has less code and is easier to understand. What do you think?
> > 
> 
> Your patch is much better than my ugly implementation ;)

Well, to be fair, it took us a number of iterations to properly see how
much it could be simplified.

> Some small fixes are required to make kselftest-ethtool_mm pass.
> 
> Would you mind if I rebase you patch, fix some small issues, make sure all
> test cases pass, split it into two patches and include them in my patchset,
> then send to review as a Co-developer and a tester?

Please feel free to split up that patch and squash it into your patches,
keeping your Author: field and just a Co-developed-by: + Signed-off-by:
for me, where parts of that patch helped you.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
