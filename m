Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 030162E915D
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jan 2021 09:02:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C439C5718C;
	Mon,  4 Jan 2021 08:02:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0A0AC5717D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Dec 2020 19:00:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BIIusIs011760; Fri, 18 Dec 2020 20:00:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=selector1;
 bh=8b7meip5c3anz5ISPIJdzkp6HNWVOIs8d92UiRmxRUo=;
 b=PCi1WDFDNvaqiYUVQZuMXyuIiyxvx45AYpOkPPQfBshAJIoeBpHiE1199Qo4Dd3zbmNJ
 QSSc4bxXym96AU61VKbKM9d6oE4lIJGFbXjXoTN3lkNUItIe8OKHrkCSYeysWUjGGpTq
 4f4+i1nCzun7PcW8+XosBzCB7V6CVeZ1MxFcMHjRS3znStgB/ILwEsXE53Slsi7DCiFX
 NGVSXsw0sVuoukdSLuBKY+lXOqqEIynssjx8BYSDdxT0uT0gWYHP/QYfRMe3bvub0YYo
 PUhgaikMMKOT84SlW4CUgVLRNHqDH6PDTpUk/y5d79ouXhl/EI0nQstGABvVHvsVrvxd /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35cpt9ux3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 20:00:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 462D310002A;
 Fri, 18 Dec 2020 20:00:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 34A26231C3D;
 Fri, 18 Dec 2020 20:00:24 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Dec 2020 20:00:23
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 18 Dec 2020 20:00:11 +0100
Message-ID: <20201218190020.1572-1-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_12:2020-12-18,
 2020-12-18 signatures=0
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:02:42 +0000
Cc: devicetree@vger.kernel.org, Valentin Caron <valentin.caron@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/7] STM32 uart cleanup and improvements
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

This series brings various fixes, cleanups and improvements to stm32-usart
driver.

Erwan Le Ray (8):
  serial: stm32: fix -Wall W=1 compilation warnings
  serial: stm32: fix code cleaning warnings and checks
  serial: stm32: add "_usart" prefix in functions name
  serial: stm32: add author
  dt-bindings: serial: stm32: update rts-gpios and cts-gpios
  serial: stm32: update conflicting RTS/CTS config comment
  serial: stm32: clean probe and remove port deinit
  serial: stm32: update transmission complete error message in shutdown

 .../bindings/serial/st,stm32-uart.yaml        |  13 +-
 drivers/tty/serial/stm32-usart.c              | 417 +++++++++---------
 2 files changed, 227 insertions(+), 203 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
