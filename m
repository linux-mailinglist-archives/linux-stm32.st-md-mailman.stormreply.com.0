Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8EE70B4DE
	for <lists+linux-stm32@lfdr.de>; Mon, 22 May 2023 08:07:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E30C1C6B461;
	Mon, 22 May 2023 06:07:25 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58B49C6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 May 2023 07:34:34 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-64d3bc502ddso1479666b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 May 2023 00:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684568073; x=1687160073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wBXlPJ2WOFDTyTHyLQ9M5/vOMvc7Mykf2q4oVdOVeEg=;
 b=QN6XoqWxTSy3GlTXwrZ/aRy5SVogCyExaBhpUYS1aG7Mq5WOb3qX89yDQW8ui6jALU
 bbgFOuA1cNZJjGOuz1NMI+TgiAvv8r+7u4GoJbQ/p40sdOef28WYQn5FJQsFXbtVkGDm
 SX52G9VZgX+PVbKjFyJ7NzW8uysNXhnSRHv/pWPAGBJcV90ve/ITlbXMgbPfhEEehLdS
 yOXFaDq9UrMxxK9Ddi4FhGa3KlEDmLTFJGylHHfigZTp9Vtx6Cdn3h8lgnVfIEHEjfIu
 O/TCrxI/eZzHhH4oqB0CX6HqHyqAINBdChpbtn26Owd3g88VwyG5oE4+njobqdVbxS0v
 3PsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684568073; x=1687160073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wBXlPJ2WOFDTyTHyLQ9M5/vOMvc7Mykf2q4oVdOVeEg=;
 b=JhiN01DJ3yA/xwqQnfbo9V3jWwsN4Zz1OLJbso2H6KLHlXMJoLiBm8VaPNDMBkcJxe
 T1q1/7PViFzOTBKMM5Ss3Fu5md2jDWq3c1CqFY5Cc9aYIHMJQiiMxpkKHAyLJhYFzgyZ
 AC4BoY4fQtF/LflmKbZXGVuBbTwAc26DMh9QMvR2WySk2j6USOGPlOJdPkwugXzQ50hh
 2w2y1Noc3CBfR0nQbo9bq44FkMO1euDSRiP5klaRaabAq74H8XX/srUifPo3mD+j10Yd
 IRwpJCtkk+RRNpvAFvAjCMFYvfBmC36T1mPH8xjWiRKjOLMkKEQzn50ke10vgYfhyDea
 4PMg==
X-Gm-Message-State: AC+VfDzErXp++pMWr+iqRNkDfCwvgFUW3fjZRhOV8ilBYGZZD2Ucc8iV
 aMMdnVBUZGn4C/3GKf2s4e0=
X-Google-Smtp-Source: ACHHUZ5QxeqwpmX+8bEEsL5MfjtiJ1O/rhGic4E6owcjthl0YEtN976ophiU97AJmOE0F6GQ6X+Lyw==
X-Received: by 2002:a05:6a00:2e87:b0:636:f899:46a0 with SMTP id
 fd7-20020a056a002e8700b00636f89946a0mr7194401pfb.15.1684568072820; 
 Sat, 20 May 2023 00:34:32 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-97-28.dynamic-ip.hinet.net.
 [36.228.97.28]) by smtp.gmail.com with ESMTPSA id
 fe21-20020a056a002f1500b0064d47cd117esm499146pfb.39.2023.05.20.00.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 00:34:32 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: kuba@kernel.org
Date: Sat, 20 May 2023 15:34:28 +0800
Message-Id: <20230520073428.3781-1-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519210439.4a3bb326@kernel.org>
References: <20230519210439.4a3bb326@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 May 2023 06:07:23 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, edumazet@google.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, simon.horman@corigine.com, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 minhuadotchen@gmail.com
Subject: Re: [Linux-stm32] [PATCH v3] net: stmmac: compare p->des0 and
	p->des1 with __le32 type values
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

Hi Jakub,

>We can make working with sparse easier by making sure it doesn't
>generate false positive warnings :\

It will be good if sparse can handle this case correctly.

>
>> (There are around 7000 sparse warning in ARCH=arm64 defconfig build and
>> sometimes it is hard to remember all the false alarm cases)
>>
>> Could you consider taking this patch, please?
>
>No. We don't take patches to address false positive static
>checker warnings.

No problem.

thanks,
Min-Hua
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
