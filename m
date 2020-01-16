Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9EF13DB58
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2020 14:21:13 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08DF7C36B0F;
	Thu, 16 Jan 2020 13:21:12 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C535C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 13:21:11 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q6so19048414wro.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2020 05:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tbAt5pOcctelyMI0Pw/2Boj48DssPhA/WaoryvyZ5m0=;
 b=Y1tnjYY9zApO2OQtTlDt04IWqpItEAIZ5N7I1UyRyrMF0VujSdOWoWeW23YpRJREit
 Ye7auccjOUK5vicYqb5Kybo0WeIT3zvCnpw2YhunRBvypG34tKCGQO+Am7f7xzTZmKzG
 O/CU2sLyQOWI0vysFxCMbgNRbAFQK7aw6ke/dLrtXqmXBOxY7x1mSWOtn8uIb/A5+bcO
 VSayKSZztrGF42u+FDH0K6DMs3+GPpUFxslOKs//lWPYKSNF+Vc+xUua0Top/zxAdZhO
 rQEOPlOwktWilbCv0LX37iTT08dPftP+a5KI+ymcN1qZpKbzkkhaYj8DmKqhEKoWAlck
 x1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tbAt5pOcctelyMI0Pw/2Boj48DssPhA/WaoryvyZ5m0=;
 b=qW+7iq4Bq1zr8ZBvSn8Ioy6ZBWKw9cHgm5QXo+j+mOl8iaLK+SESo4gYAtwblqWpFo
 gIKRpbjF+OZZuGUxDuaqjQkbJRAWlEat9F4M/Er4XUxp3AphpofwdL2Yvj0QWnhfr5Xw
 a1uYx+JyewV6BgosDMT7hwuoBUHyCHrpbF5As1BS/WxI6xkzkKSS5jWkihiW035a8coX
 eTNOZhtf2buRmfLGENc5taa0pgrPRq+pL/dcyETq7s3pUapzpaPf5rSFqWFKEqHwdqvw
 axvlPjUN6FlMEmxa0vkSsWwls3IBBY76iIkF/u4Mf/NIkFFZv6Vaw0YguzQxx6PRdMQ+
 yJUw==
X-Gm-Message-State: APjAAAVUyJKdt2pSoUJK7VodGXWp1FUleIRUVwD11IfL5UB70cmExx3+
 GTnx0m0g3/zLqHYvz+Mh+YU=
X-Google-Smtp-Source: APXvYqw01+GqfkH35JYXyBsSnjwvr0X4uh+5I3kzup5rww9ZVJeL67W4XhmH/pce4L5zuqrTSc5t4g==
X-Received: by 2002:a05:6000:1187:: with SMTP id
 g7mr3415042wrx.109.1579180870884; 
 Thu, 16 Jan 2020 05:21:10 -0800 (PST)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id o15sm29681752wra.83.2020.01.16.05.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 05:21:09 -0800 (PST)
Date: Thu, 16 Jan 2020 14:21:07 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Iuliana Prodan <iuliana.prodan@nxp.com>
Message-ID: <20200116132107.GB26487@Red>
References: <20200114135936.32422-1-clabbe.montjoie@gmail.com>
 <20200114135936.32422-7-clabbe.montjoie@gmail.com>
 <VI1PR04MB44455F7F7830159B6ED336648C360@VI1PR04MB4445.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1PR04MB44455F7F7830159B6ED336648C360@VI1PR04MB4445.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 Horia Geanta <horia.geanta@nxp.com>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "wens@csie.org" <wens@csie.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH RFC 06/10] crypto: engine: introduce ct
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

On Thu, Jan 16, 2020 at 11:34:19AM +0000, Iuliana Prodan wrote:
> On 1/14/2020 4:00 PM, Corentin Labbe wrote:
> > We will store the number of request in a batch in engine->ct.
> > This patch adds all loop to unprepare all requests of a batch.
> > 
> > Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> > ---
> >   crypto/crypto_engine.c  | 30 ++++++++++++++++++------------
> >   include/crypto/engine.h |  2 ++
> >   2 files changed, 20 insertions(+), 12 deletions(-)
> > 
> > diff --git a/crypto/crypto_engine.c b/crypto/crypto_engine.c
> > index b72873550587..591dea5ddeec 100644
> > --- a/crypto/crypto_engine.c
> > +++ b/crypto/crypto_engine.c
> > @@ -28,6 +28,7 @@ static void crypto_finalize_request(struct crypto_engine *engine,
> >   	bool finalize_cur_req = false;
> >   	int ret;
> >   	struct crypto_engine_ctx *enginectx;
> > +	int i = 0;
> >   
> >   	spin_lock_irqsave(&engine->queue_lock, flags);
> >   	if (engine->cur_reqs[0].req == req)
> You're checking here just the first request, but do the completion for 
> all? Why? Shouldn't we check for each request if it was done by hw or not?

The first request is a sort of key for the whole batch.
> 
> I've also seen that the do_one_request is called only on the first 
> request, from the batch.

Since the request are linked, this is not a problem.
But I miss this explanaition in the code.

> 
> In your driver you do the prepare/unprepare for the whole batch at once, 
> but not all drivers, who uses crypto-engine, are doing this (see virtio, 
> amlogic, stm32). And I don't know if they can...

prepare is optionnal, and unprepare is optional even if prepare is done.
Furthermore, doing prepare/unprepare is optional per request.
I have tested this serie on sun8i-ss and amlogic which dont use prepare/unprepare.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
