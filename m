Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F4D87CDC1
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Mar 2024 14:09:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35F8AC6DD6E;
	Fri, 15 Mar 2024 13:09:45 +0000 (UTC)
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C504C64102
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Mar 2024 13:09:43 +0000 (UTC)
X-SubmittedBy: id balejk@matfyz.cz subject
 /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,
 +20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
 serial F5FD910E8FE2121B897F7E55B84E351D
 issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
 auth type TLS.CUNI
Received: from localhost (cdwifi-a106.cd-t.cz [213.235.133.106] (may be
 forged)) (authenticated)
 by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 42FD8Ug8098517
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 15 Mar 2024 14:08:33 +0100 (CET)
 (envelope-from balejk@matfyz.cz)
Mime-Version: 1.0
Date: Fri, 15 Mar 2024 14:09:01 +0100
Message-Id: <CZUCJ4CEVXMS.2MML8IFVVTBC9@matfyz.cz>
To: <regressions@lists.linux.dev>
From: "Karel Balej" <balejk@matfyz.cz>
References: <005f998ec59e27633b1b99fdf929e40ccfd401c1.camel@sipsolutions.net>
 <f2dcbe55-0f0e-4173-8e21-f899c6fc802a@gmail.com>
 <NbWQKmrYDD20KKHeq9TMda2MJFE00-weepZGuSIRzO5BOgMlTbWBkDlNNweA2dhbvF8TK1F_cHbMxblLVNREZa1HZEFt9TVCkTB1jo_5ppc=@yartys.no>
 <CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz>
 <20231010212240.61637-1-dimitri.ledkov@canonical.com>
 <CZSVWO3IDZ96.38O0P161Z99XU@matfyz.cz>
In-Reply-To: <CZSVWO3IDZ96.38O0P161Z99XU@matfyz.cz>
Cc: dimitri.ledkov@canonical.com, Michael Yartys <mail@yartys.no>,
 herbert@gondor.apana.org.au, linux-wireless@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 dhowells@redhat.com, mcgrof@kernel.org, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-modules@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, iwd@lists.linux.dev,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, James
 Prestwood <prestwoj@gmail.com>
Subject: Re: [Linux-stm32] [REGRESSION] Re: [PATCH] crypto: pkcs7: remove
	sha1 support
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

#regzbot title: SHA1 support removal breaks iwd's ability to connect to eduroam
#regzbot monitor: https://lore.kernel.org/all/20240313233227.56391-1-ebiggers@kernel.org/
#regzbot monitor: https://lore.kernel.org/all/CZSHRUIJ4RKL.34T4EASV5DNJM@matfyz.cz/
#regzbot link: https://lore.kernel.org/iwd/njvxKaPo_CBxsQGaNSRHj8xOSxzk1_j_K-minIe4GCKUMB1qxJT8nPk9SGmfqg7Aepm_5dO7FEofYIYP1g15R9V5dJ0F8bN6O4VthSjzu1g=@yartys.no/

Sorry for the tracking mess...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
