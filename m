Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D404542D9E9
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Oct 2021 15:13:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6992FC5C83D;
	Thu, 14 Oct 2021 13:13:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 113C6C5C837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Oct 2021 13:13:41 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19EBk9nv020035; 
 Thu, 14 Oct 2021 15:13:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=YjQ3urDAJXHR/F3Axv6sVr5AjLaz89bV+mq261IIQQY=;
 b=cXLM99+NE6XvfugKPfl3nOtV9X2sQ/UGiGn/Bvwn3yIg8Gn0qOfhVlkLqQfWVcKxOZeK
 G0cwYu83kyoIwGUQqSd0yq8PnIRe26WIYHH5JhXbNnCcHEAHGktFfERka4p3W7lxTJIt
 OdVjWUec3Dgp8ZwhccwWGS62tJ14ZBJV6jcgsm3VtLQyZgx7+oa7jRTp7JNtunbMgNVc
 MgRwNE3WKuNKA4YqaGdFqFX1CK23b677pH1LJa+FxRclmCe/1Rm5AXM2Z2+Zgt7Pt9w0
 6d+wxfql0WvJ3soU5kWG1F55dP1GqduQzrXXod0gQ1+/9rku79lOOSTwguCxbLPxpPJa YQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bpkye8fy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Oct 2021 15:13:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 87DB410002A;
 Thu, 14 Oct 2021 15:13:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7FA5622179A;
 Thu, 14 Oct 2021 15:13:14 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 14 Oct 2021 15:13:14
 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Olivier Moysan <olivier.moysan@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Thu, 14 Oct 2021 15:12:21 +0200
Message-ID: <20211014131228.4692-1-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-14_08,2021-10-14_02,2020-04-07_01
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v5 0/7] iio: adc: stm32-adc: add internal
	channels support
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

This patchset adds support of ADC2 internal channels VDDCORE, VREFINT and VBAT
on STM32MP15x SoCs. The generic IIO channel bindings is also introduced here
to provide this feature. The legacy channel binding is kept for backward compatibility.

Changes in v2:
- Add 'deprecated' to channels legacy properties in ADC bindings
- Add set/clr service for common registers, to make code more generic in
  internal channels enable/disable services.
- Expose vrefint channel as a processed channel to return
  the actual value of vrefp.
- Minor code improvements

Changes in v3:
- fix vrefint sampling time check.

Changes in v4:
- fix binding
- add dedicated spin lock for common register
- manage probe_defer on nvmem read

Changes in v5:
- fix binding example

v5 resent as serie index was wrong on previous post. sorry !

Olivier Moysan (7):
  dt-bindings: iio: stm32-adc: add generic channel binding
  dt-bindings: iio: stm32-adc: add nvmem support for vrefint internal
    channel
  iio: adc: stm32-adc: split channel init into several routines
  iio: adc: stm32-adc: add support of generic channels binding
  iio: adc: stm32-adc: add support of internal channels
  iio: adc: stm32-adc: add vrefint calibration support
  iio: adc: stm32-adc: use generic binding for sample-time

 .../bindings/iio/adc/st,stm32-adc.yaml        | 108 ++++-
 drivers/iio/adc/stm32-adc-core.c              |   1 +
 drivers/iio/adc/stm32-adc-core.h              |  10 +
 drivers/iio/adc/stm32-adc.c                   | 422 ++++++++++++++++--
 4 files changed, 486 insertions(+), 55 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
