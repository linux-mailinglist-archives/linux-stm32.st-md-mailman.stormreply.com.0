Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE0433AF03
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Mar 2021 10:44:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8E27C57B5A;
	Mon, 15 Mar 2021 09:44:54 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 178A1C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 09:44:54 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id s21so8475157pjq.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Mar 2021 02:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=8pkO9yAZnwW7J9QjEa+yYi7bDNBj14jH5hur2WWahHc=;
 b=dHGJ7Lkm/PwiD8nnzH6zF/RtsuCmOeBtcsIJBN4j3oRtAxoeJ/9bJt/H80gZXYt2Tr
 id/8c9wrJQ73z6rXoaljsgfC0EZoqoNcdBDcq3SIMucWjC9/YY5gVb1PUOIt1I8e23aT
 XX1xDi29mCpyptfpgV9waLelyZoPVaWCQKOmVgwzkgPROVznb0mClIuZ89cg3ZhSLzER
 1xIe/0xaOhdsdRakMGNIJyXFnE6WvtqvtIg1tvlpjcrs0HVrqf1oSTZvpi9oQpOqHycs
 gO+hPjwf5ljglM08eOgCC1Q3oZWfL+V35C+Fh0ekmQLae1ag3Y6z8sgQXFVjBnsS7mwv
 07GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=8pkO9yAZnwW7J9QjEa+yYi7bDNBj14jH5hur2WWahHc=;
 b=GlOA7fIZ1y843Cx0Ta8ZCIpZZ/x6wxaeJagKVzZ8NOB9Ty6tVzy1a4cG95jdfpmJ/z
 j9imzKoFeh412/Ny+IIo4zmZwRGBFdcVPDQCkyTDPfy+dM/HlXs30ebXpDXlEEEjBYLg
 oiYEmNnr4eRI4Xgci4lATt8vr0XjyaPbTdUkcjpBxg9oucKmChBMImWx03/B1A/4FVIh
 J6RfNogEdajCQY8dyhots+5J3b4yn58Eyhbe6KrEEy2G/ZowAq6LjSasZo54ZD/i+xmq
 PFukfedmpTphlb/9+YyE49324cdmnm3lldnITrU5HY5qNbOneTJmu88PoFtgzxaUsYzw
 rYKw==
X-Gm-Message-State: AOAM5305+qKn2NOt68JMyxzsqDU5damFXkqYK12Z2uqF1L8ifxVv7Vf0
 3xPN2Bibrd/zY+iHOaCrYNw=
X-Google-Smtp-Source: ABdhPJyalTFyuCcjruKNM+P6ACpB25POCsvC1cOS4JJZ0v0TY8QmqusChXUCxsjKM7qXH89+aGNWjw==
X-Received: by 2002:a17:90b:94c:: with SMTP id
 dw12mr11947537pjb.119.1615801492598; 
 Mon, 15 Mar 2021 02:44:52 -0700 (PDT)
Received: from localhost.localdomain ([120.245.122.54])
 by smtp.gmail.com with ESMTPSA id 14sm12780811pfy.55.2021.03.15.02.44.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Mar 2021 02:44:52 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, alexandre.torgue@foss.st.com, a.fatoum@pengutronix.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@st.com, erwan.leray@foss.st.com,
 linux-serial@vger.kernel.org
Date: Mon, 15 Mar 2021 17:43:50 +0800
Message-Id: <1615801436-3016-4-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
References: <1615801436-3016-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v3 3/9] dt-bindings: pinctrl: stm32: Add
	stm32h750 pinctrl
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

This patch intend to add pinctrl configuration support for
stm32h750 value line

The datasheet of stm32h750 value line can be found at:
https://www.st.com/resource/en/datasheet/stm32h750ib.pdf

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 72877544ca78..59f33cbe8f48 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -24,6 +24,7 @@ properties:
       - st,stm32f746-pinctrl
       - st,stm32f769-pinctrl
       - st,stm32h743-pinctrl
+      - st,stm32h750-pinctrl
       - st,stm32mp157-pinctrl
       - st,stm32mp157-z-pinctrl
 
-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
