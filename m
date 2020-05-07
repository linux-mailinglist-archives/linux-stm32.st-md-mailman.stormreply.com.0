Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F61B1C8581
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 11:16:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46FFAC3F931;
	Thu,  7 May 2020 09:16:27 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F4014C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 09:16:24 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id x2so2730967pfx.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 02:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1KzhO/ACECx0/dr+gtbAvw5TnzOduSA4Deti3fiFsj4=;
 b=gd81d8AEVygmBWV4uBrIRxZAPQpzmNitA0DwI6a8WA2ft8QnWGMSpNqYWkC56oUXPI
 8rC9iQWvdUKOUwqNld0DJJIg/ADC88MYJ3+T+wKtc+lU+DgVqudREKvHirbDeRAdQeFj
 Fn4CWdq7Y//hWireUffGioHQuzz8aLjpliAzi6zwheRqMR+MZhb2E/6N4qWmQE2enta7
 YbKNTn8A4UBhoUAnE+B7FTN9h6YdcTBjSCNgByXJHw04EayhIoqX/Ak9fQHExJqmV3jF
 JOjtvQTvqu0F1f9cHxZX3SiFOOmiqmw81dOePciD9dxbOvrWrkG+en8ZRMcHi/JMZbkY
 fvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1KzhO/ACECx0/dr+gtbAvw5TnzOduSA4Deti3fiFsj4=;
 b=AwNOH/gpc7jRxZHBqiJjO/D4u03hapb6fckX/V7Ndm6dNFUksg0rg5hNl5zfeTlrmZ
 scRliXtST+cYruuZ5uX85APOoneA0H+sFZxAadWVzBtjXUOQQNZyi2TTkTjzDAi+9gdc
 cUG20buYqyuYiEmvGtBT4jNnVabxsL+Vgy2JWIWf59gmCqV1eYwzmzU1/bRtyAToJRLF
 IfMhQRiL6sHafXxtkT7zZHFkr0k/uNr0ieGbxC34vmniipYOyuddmnwU2q2mdlEWXPVe
 jnMJsKHssAjjL9I+g47vO8owN5LXanrr6Y+TvUSULtp/Tc+BqKkVAYKgiXgjN4KZJoJs
 42Pg==
X-Gm-Message-State: AGi0Puax0ECZUQYn6/Z5dxsC5a03LqI/Nz7524KQVbxya1L5lQShlfSZ
 WpkzuL3BAepYNlhnpk83fJw=
X-Google-Smtp-Source: APiQypIJtHkul5mTY+BSnA1xpHhQ03Lmx87fCT6Ex3npB1S/4ZvMkG814rEtcY8RcbGOdGl8EYTHJw==
X-Received: by 2002:a63:d74a:: with SMTP id w10mr4015942pgi.417.1588842983418; 
 Thu, 07 May 2020 02:16:23 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id m8sm660100pjz.27.2020.05.07.02.16.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 02:16:23 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Thu,  7 May 2020 17:16:10 +0800
Message-Id: <1588842971-20495-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <philippe.schenker@toradex.com>
References: <philippe.schenker@toradex.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/4] ARM: dts: stm32: enable stmpe811 on
	stm32429-disco board
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

[PATCH 3/4] ARM: dts: stm32: enable stmpe811 on stm32429-disco board

remove id, blocks, irq-trigger from the stmpe mfd dts node.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
