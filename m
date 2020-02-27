Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D1E17124F
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2020 09:19:03 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31E25C36B0B;
	Thu, 27 Feb 2020 08:19:03 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20057.outbound.protection.outlook.com [40.107.2.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC12BC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2020 06:25:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obZh0PjHmp7eE7wYoPlOUhUOgJsjasCFZxg3KVHsRnf22/eg6DDmVNou0zy1GuLMriXta0aa+rLD4VyFgcHspjIRYzVnpp3k0z7oXbPF/BXDFJsSZjJ81pWuxjE4R1hohEOHCqN03NTQGMwI+tPGnWFWPgXb3nVbLDEYvkWDZYcar1cx7MLk8QCanM+fo8bID/l6asa8ObiJQNCG6SXMS8AQvRWk5rKHGx0Dqtm9oryGn97+mdkkIylP15LCuK920+NWj/+qAmpZuAPxGEBf+6YikHOkBOJdpYVaf2UVig81kUYPWI9A5nt78s/F1oyP5/eAGsAzQvLFmmvlbA762Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJL17HUx2fHaO+Oc4r4ymsOqOQN+fnjw+67gT6DiLjI=;
 b=YHkFmjeLgTSJlMaQWchHXdYXmY1RPgRF8YSBSCew909HhfAIve412ONJxOzcIS0IK2KnnaYikPjBuI7Izm+QJgurn6WRETwXxLWB9QxzMFuh61BvNkDuQCtYueLXg6NhKNXwQpZcOr1byn6IBZEMAcCE79srFwIeyBRtFCMvU8YX65VyWezXnMc9/ZNrFI7Z195OZpSOPOuPzZe8AoZLTf1rvzm30PaasOF5u7t4LZYxU0/JXi7IuSPHwxWP4OQQH/PE3QYb6fwBoXL8hjIoYDIO70TFnuq2LYCHgRO0tkXZW+AljJJ2ZAlhYZ6M6OZOs1if1XyhQr3vXXEmLdtrMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TJL17HUx2fHaO+Oc4r4ymsOqOQN+fnjw+67gT6DiLjI=;
 b=h7t0CGM0NY87t+/JvasNPtRKb6t4b4r+NITGdNN+FZvqChnHSSHlz7OMEH1HT8aAx+N5HrHylF4ThRDxm2C+lUFyqW8jbUvfwRaNriQDTZDyGepLPuZH2cyFmGjvxPc0WJSewjgUNCzz5T9xt2AhobGqyNa92OMX92E6qm1uHb0=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4883.eurprd04.prod.outlook.com (20.176.215.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14; Thu, 27 Feb 2020 06:25:52 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::91e2:17:b3f4:d422%3]) with mapi id 15.20.2772.012; Thu, 27 Feb 2020
 06:25:51 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Arnaud POULIQUEN
 <arnaud.pouliquen@st.com>
Thread-Topic: [PATCH v5 1/3] remoteproc: add support for co-processor loaded
 and booted before kernel
Thread-Index: AQHV52cWkaG3oUYM5k+Q+3HffuA6bKgj00eAgADKmgCACaTfAIAAW4/w
Date: Thu, 27 Feb 2020 06:25:51 +0000
Message-ID: <AM0PR04MB44812B2CE7ABB302DF72FA5288EB0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20200211174205.22247-1-arnaud.pouliquen@st.com>
 <20200211174205.22247-2-arnaud.pouliquen@st.com>
 <20200213200813.GA14415@xps15> <24947b31-bef6-cfb3-686e-80bef6f974e3@st.com>
 <CANLsYkxhWWgVFVe3=5WOYkYGQgV7g+3FvDKRDKi7y9kuk4_G8w@mail.gmail.com>
 <d6e09b93-f287-78a0-a6d9-3d9ea0a5f3d7@st.com>
 <CANLsYkzQz5yyu+KViEL8GwWtp7cfBotS8Fuvs1MJzvYq4LxOig@mail.gmail.com>
 <07d5bea4-1585-db55-4ca0-ae28dcf81d41@st.com>
 <CANLsYkwPHZQ776AtSmzLO=m7Uxa4Dmw+aVrWL+tB5-ZUNy=N3g@mail.gmail.com>
 <CANLsYkwAyY86+85nWuP67wB+h8ycSNkbPmjmGz1-s=xVU5qs=w@mail.gmail.com>
In-Reply-To: <CANLsYkwAyY86+85nWuP67wB+h8ycSNkbPmjmGz1-s=xVU5qs=w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ea610392-2446-49b7-cb53-08d7bb4de4a8
x-ms-traffictypediagnostic: AM0PR04MB4883:
x-microsoft-antispam-prvs: <AM0PR04MB48832FF05DD6E65C1DC5135A88EB0@AM0PR04MB4883.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 03264AEA72
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(39860400002)(376002)(136003)(346002)(366004)(396003)(189003)(199004)(8676002)(66476007)(45080400002)(64756008)(478600001)(66946007)(8936002)(71200400001)(66446008)(5660300002)(54906003)(30864003)(66556008)(81156014)(110136005)(81166006)(966005)(76116006)(316002)(86362001)(26005)(186003)(52536014)(6506007)(53546011)(33656002)(2906002)(4326008)(9686003)(55016002)(44832011)(7416002)(7696005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB4883;
 H:AM0PR04MB4481.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GYJaAdCl2FglpV5L0mqD3fvLq6iDm8srQ94P6/g+RjcU+5L44/FnC+WJ+tZPrkfQHoy+wR0s/P1iGSpDD8KwPMx1P8N1pY/kZrjSnbabRZwHd/oww6tdWeTDFV7wt2xkqykeMx1FRm6wqRnt7fjWK5PgMCDNdSKSPCt6zJqoYARN7W/7IC1sEMNXBkrVaHdESzUG7RQbguzEjEpFclT35UgVeC4REV7nHkrNpAt0wz+90gTh8+9AuprHLTtkE1lRdbemh0vVB+Gy75i9kLcqGYAxFVazzMV2OBBzfj6PQn7ppceCUoqCPSIoCYriV6G5mApoIlr382FcrKP+882FUMz50LYEUOZs7rBHcEdV32sR6nwN2SxxleUf5lN2gvsBZV7N+mIDR0f6Q0I16eMaIUCTfIfSmaB19CyizKjw3CeWmeyRhXvsp9W92c2kBkv+OUEZKGpBVVEWLnm5b/1ezDzDzzuubj+phNN+Xl30iMRCfXjh/CMDtGCIto69qYaJYKCZ3uZU28A8MuMtHeefsTUG7cH/d1Akf9nw+/N3htmLFR1KlMXfJv7oDxlU6mCjQ8X33t2eBDtajtZ2uS7kc6aqno1+HQXihCr9A4DXtVFJjqarVAkl8mXhy7+y3M90
x-ms-exchange-antispam-messagedata: 5CFGN6S+RT3zzLe4Xp1sSlpaZ82YyVQQSAYmWCweo4cd+4Bci3NtiSj5eRGkf8R4u0BRlJ/h3lHSwiPmcAJkRpzf+lq0Qt+vslPwjZCqMpb+gbk8Y4N8Fj20bdoIh1Y8ei8sFAk2QihVxutxBb9/LQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea610392-2446-49b7-cb53-08d7bb4de4a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2020 06:25:51.7998 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+q76hG4xTGJl8ovLdgyZvvgSGvBCAtIVou+Q4r6ZRDsX1WanMinLA8mGycsyD6NHnqAHGy+1Ja5wUTyMh8LDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4883
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:19:01 +0000
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 linux-remoteproc <linux-remoteproc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Suman Anna <s-anna@ti.com>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v5 1/3] remoteproc: add support for
 co-processor loaded and booted before kernel
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

> Subject: Re: [PATCH v5 1/3] remoteproc: add support for co-processor loaded
> and booted before kernel
> 
> On Thu, 20 Feb 2020 at 14:40, Mathieu Poirier <mathieu.poirier@linaro.org>
> wrote:
> >
> > On Thu, 20 Feb 2020 at 02:35, Arnaud POULIQUEN
> <arnaud.pouliquen@st.com> wrote:
> > >
> > >
> > >
> > > On 2/19/20 9:56 PM, Mathieu Poirier wrote:
> > > > Hey Arnaud,
> > > >
> > > > On Tue, 18 Feb 2020 at 10:31, Arnaud POULIQUEN
> <arnaud.pouliquen@st.com> wrote:
> > > >>
> > > >> Hi Mathieu, Bjorn,
> > > >>
> > > >> On 2/17/20 7:40 PM, Mathieu Poirier wrote:
> > > >>> On Fri, 14 Feb 2020 at 09:33, Arnaud POULIQUEN
> <arnaud.pouliquen@st.com> wrote:
> > > >>>>
> > > >>>> Hi Mathieu,
> > > >>>>
> > > >>>> On 2/13/20 9:08 PM, Mathieu Poirier wrote:
> > > >>>>> Good day,
> > > >>>>>
> > > >>>>> On Tue, Feb 11, 2020 at 06:42:03PM +0100, Arnaud Pouliquen
> wrote:
> > > >>>>>> From: Loic Pallardy <loic.pallardy@st.com>
> > > >>>>>>
> > > >>>>>> Remote processor could boot independently or be
> > > >>>>>> loaded/started before Linux kernel by bootloader or any
> firmware.
> > > >>>>>> This patch introduces a new property in rproc core, named
> > > >>>>>> skip_fw_load, to be able to allocate resources and
> > > >>>>>> sub-devices like vdev and to synchronize with current state
> without loading firmware from file system.
> > > >>>>>> It is platform driver responsibility to implement the right
> > > >>>>>> firmware load ops according to HW specificities.
> > > >>>>>>
> > > >>>>>> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> > > >>>>>> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > > >>>>>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
> > > >>>>>> ---
> > > >>>>>>  drivers/remoteproc/remoteproc_core.c | 67
> ++++++++++++++++++++++------
> > > >>>>>>  include/linux/remoteproc.h           |  2 +
> > > >>>>>>  2 files changed, 55 insertions(+), 14 deletions(-)
> > > >>>>>>
> > > >>>>>> diff --git a/drivers/remoteproc/remoteproc_core.c
> > > >>>>>> b/drivers/remoteproc/remoteproc_core.c
> > > >>>>>> index 097f33e4f1f3..876b5420a32b 100644
> > > >>>>>> --- a/drivers/remoteproc/remoteproc_core.c
> > > >>>>>> +++ b/drivers/remoteproc/remoteproc_core.c
> > > >>>>>> @@ -1358,8 +1358,19 @@ static int rproc_start(struct rproc
> *rproc, const struct firmware *fw)
> > > >>>>>>      return ret;
> > > >>>>>>  }
> > > >>>>>>
> > > >>>>>> -/*
> > > >>>>>> - * take a firmware and boot a remote processor with it.
> > > >>>>>> +/**
> > > >>>>>> + * rproc_fw_boot() - boot specified remote processor
> > > >>>>>> +according to specified
> > > >>>>>> + * firmware
> > > >>>>>> + * @rproc: handle of a remote processor
> > > >>>>>> + * @fw: pointer on firmware to handle
> > > >>>>>> + *
> > > >>>>>> + * Handle resources defined in resource table, load firmware
> > > >>>>>> +and
> > > >>>>>> + * start remote processor.
> > > >>>>>> + *
> > > >>>>>> + * If firmware pointer fw is NULL, firmware is not handled
> > > >>>>>> +by remoteproc
> > > >>>>>> + * core, but under the responsibility of platform driver.
> > > >>>>>> + *
> > > >>>>>> + * Returns 0 on success, and an appropriate error value
> otherwise.
> > > >>>>>>   */
> > > >>>>>>  static int rproc_fw_boot(struct rproc *rproc, const struct
> > > >>>>>> firmware *fw)  { @@ -1371,7 +1382,11 @@ static int
> > > >>>>>> rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
> > > >>>>>>      if (ret)
> > > >>>>>>              return ret;
> > > >>>>>>
> > > >>>>>> -    dev_info(dev, "Booting fw image %s, size %zd\n", name,
> fw->size);
> > > >>>>>> +    if (fw)
> > > >>>>>> +            dev_info(dev, "Booting fw image %s, size %zd\n",
> name,
> > > >>>>>> +                     fw->size);
> > > >>>>>> +    else
> > > >>>>>> +            dev_info(dev, "Synchronizing with preloaded
> > > >>>>>> + co-processor\n");
> > > >>>>>>
> > > >>>>>>      /*
> > > >>>>>>       * if enabling an IOMMU isn't relevant for this rproc,
> > > >>>>>> this is @@ -1718,16 +1733,22 @@ static void
> rproc_crash_handler_work(struct work_struct *work)
> > > >>>>>>   * rproc_boot() - boot a remote processor
> > > >>>>>>   * @rproc: handle of a remote processor
> > > >>>>>>   *
> > > >>>>>> - * Boot a remote processor (i.e. load its firmware, power it
> on, ...).
> > > >>>>>> + * Boot a remote processor (i.e. load its firmware, power it
> > > >>>>>> + on, ...) from
> > > >>>>>> + * different contexts:
> > > >>>>>> + * - power off
> > > >>>>>> + * - preloaded firmware
> > > >>>>>> + * - started before kernel execution
> > > >>>>>> + * The different operations are selected thanks to
> > > >>>>>> + properties defined by
> > > >>>>>> + * platform driver.
> > > >>>>>>   *
> > > >>>>>> - * If the remote processor is already powered on, this
> > > >>>>>> function immediately
> > > >>>>>> - * returns (successfully).
> > > >>>>>> + * If the remote processor is already powered on at rproc
> > > >>>>>> + level, this function
> > > >>>>>> + * immediately returns (successfully).
> > > >>>>>>   *
> > > >>>>>>   * Returns 0 on success, and an appropriate error value
> otherwise.
> > > >>>>>>   */
> > > >>>>>>  int rproc_boot(struct rproc *rproc)  {
> > > >>>>>> -    const struct firmware *firmware_p;
> > > >>>>>> +    const struct firmware *firmware_p = NULL;
> > > >>>>>>      struct device *dev;
> > > >>>>>>      int ret;
> > > >>>>>>
> > > >>>>>> @@ -1758,11 +1779,20 @@ int rproc_boot(struct rproc *rproc)
> > > >>>>>>
> > > >>>>>>      dev_info(dev, "powering up %s\n", rproc->name);
> > > >>>>>>
> > > >>>>>> -    /* load firmware */
> > > >>>>>> -    ret = request_firmware(&firmware_p, rproc->firmware,
> dev);
> > > >>>>>> -    if (ret < 0) {
> > > >>>>>> -            dev_err(dev, "request_firmware failed: %d\n",
> ret);
> > > >>>>>> -            goto downref_rproc;
> > > >>>>>> +    if (!rproc->skip_fw_load) {
> > > >>>>>> +            /* load firmware */
> > > >>>>>> +            ret = request_firmware(&firmware_p,
> rproc->firmware, dev);
> > > >>>>>> +            if (ret < 0) {
> > > >>>>>> +                    dev_err(dev, "request_firmware
> failed: %d\n", ret);
> > > >>>>>> +                    goto downref_rproc;
> > > >>>>>> +            }
> > > >>>>>> +    } else {
> > > >>>>>> +            /*
> > > >>>>>> +             * Set firmware name pointer to null as
> remoteproc core is not
> > > >>>>>> +             * in charge of firmware loading
> > > >>>>>> +             */
> > > >>>>>> +            kfree(rproc->firmware);
> > > >>>>>> +            rproc->firmware = NULL;
> > > >>>>>
> > > >>>>> If the MCU with pre-loaded FW crashes request_firmware() in
> > > >>>>> rproc_trigger_recovery() will return an error and
> > > >>>>> rproc_start() never called.
> > > >>>>
> > > >>>> Right, something is missing in the recovery function to prevent
> > > >>>> request_firmware call if skip_fw_load is set
> > > >>>>
> > > >>>> We also identify an issue if recovery fails:
> > > >>>> In case of recovery issue the rproc state is RPROC_CRASHED, so
> > > >>>> that it is no more possible to load a new firmware from user space.
> > > >>>> This issue is not linked to this patchset. We have patches on our
> shelves for this.
> > > >>>>
> > > >>>>>>      }
> > > >>>>>>
> > > >>>>>>      ret = rproc_fw_boot(rproc, firmware_p); @@ -1916,8
> > > >>>>>> +1946,17 @@ int rproc_add(struct rproc *rproc)
> > > >>>>>>      /* create debugfs entries */
> > > >>>>>>      rproc_create_debug_dir(rproc);
> > > >>>>>>
> > > >>>>>> -    /* if rproc is marked always-on, request it to boot */
> > > >>>>>> -    if (rproc->auto_boot) {
> > > >>>>>> +    if (rproc->skip_fw_load) {
> > > >>>>>> +            /*
> > > >>>>>> +             * If rproc is marked already booted, no need to
> wait
> > > >>>>>> +             * for firmware.
> > > >>>>>> +             * Just handle associated resources and start sub
> devices
> > > >>>>>> +             */
> > > >>>>>> +            ret = rproc_boot(rproc);
> > > >>>>>> +            if (ret < 0)
> > > >>>>>> +                    return ret;
> > > >>>>>> +    } else if (rproc->auto_boot) {
> > > >>>>>> +            /* if rproc is marked always-on, request it to
> > > >>>>>> + boot */
> > > >>>>>
> > > >>>>> I spent way too much time staring at this modification...  I
> > > >>>>> can't decide if a system where the FW has been pre-loaded should
> be considered "auto_boot".
> > > >>>>> Indeed the result is the same, i.e the MCU is started at boot
> > > >>>>> time without user intervention.
> > > >>>>
> > > >>>> The main difference is that the firmware is loaded by the Linux
> remote proc in case of auto-boot.
> > > >>>> In auto-boot mode the remoteproc loads a firmware, on probe, with
> a specified name without any request from user space.
> > > >>>> One constraint of this mode is that the file system has to be
> accessible before the rproc probe.
> > > >>>
> > > >>> Indeed, but in both cases the MCU is booted automatically.  In
> > > >>> one case the FW is loaded by the framework and in the other it
> > > >>> is not.  As such both scenarios are "auto_boot", they simply
> > > >>> have different flavours.
> > > >> Regarding your concerns i would like to propose an alternative that will
> answer to following use cases:
> > > >>
> > > >> In term of use cases we can start the remote proc firmware in following
> modes:
> > > >> - auto boot with FW loading, resource table parsing and FW
> > > >> start/stop
> > > >> - auto boot without FW loading, with FW resource table parsing
> > > >> and FW start/stop
> > > >> - auto boot with FW attachment and  resource table parsing
> > > >> - boot on userspace request with FW loading, resource table
> > > >> parsing and FW start/stop
> > > >> - boot on userspace request without FW loading, with FW resource
> > > >> table parsing and FW start/stop
> > > >> - boot on userspace request with FW attachment and  resource
> > > >> table parsing
> > > >>
> > > >> I considered the recovery covered by these use cases...
> > > >>
> > > >> I tried to concatenate all use case to determine the behavior of the core
> and platform driver:
> > > >> - "auto-boot" used to decide if boot is from driver or user space
> > > >> request (independently from fw loading and live cycle management)
> > > >> - "skip_fw_load" allows to determine if a firmware has to be loaded or
> not.
> > > >> - remote Firmware live cycle (start,stop,...) are managed by the
> platform driver, it would have to determine the manage the remote proc
> depending on the mode detected.
> > > >>
> > > >> If i apply this for stm32mp1 driver:
> > > >> normal boot( FW started on user space request):
> > > >>   - auto-boot = 0
> > > >>   - skip_fw_load = 0
> > > >> FW loaded and started by the bootloader
> > > >>   - auto-boot = 1
> > > >>   - skip_firmware = 1;
> > > >>
> > > >> => on a stop: the "auto-boot" and "skip_firmware flag will be reset by
> the stm32rproc driver, to allow user space to load a new firmware or reste
> the system.
> > > >> this is considered as a ack by Bjorn today, if you have an alternative
> please share.
> > > >
> > > > I wonder if we can achieve the same results without needing
> > > > rproc::skip_fw_load...  For cases where the FW would have been
> > > > loaded and the MCU started by another entity we could simply set
> > > > rproc->state = RPROC_RUNNING in the platform driver.  That way
> > > > when the MCU is stopped or crashes, there is no flag to reset,
> > > > rproc->state is simply set correctly by the current code.
> > > >
> > > > I would also set auto_boot =1 in order to start the AP
> > > > synchronisation as quickly as possible and add a check in
> > > > rproc_trigger_auto_boot() to see if rproc->state == RPROC_RUNNING.
> > > > If so simply call rproc_boot() where platform specific rproc_ops
> > > > would be tailored to handle a running processor.
> > >
> > > Your proposal is interesting, what concerns me is that seems to work
> > > only for a first start.
> >
> > Correct, my proposal will skip loading the MCU firmware only when
> > Linux boots and MCU probed.  I thought this was what your patchset is
> > doing.
> >
> > > And calling rproc_boot, while state is RPROC_RUNNING seems pretty
> > > strange for me.
> >
> > After sending my email I thought about spinning off a new function,
> > something like rproc_sync() and call it instead of rproc_boot().  But
> > none of that matters now that Peng has highlighted the need to handle
> > late attach scenarios where the FW is never loaded by the remoteproc
> > core.
> >
> > > Also, as Peng mentions in
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpa
> > >
> tchwork.kernel.org%2Fpatch%2F11390485%2F&amp;data=02%7C01%7Cpen
> g.fan
> > > %40nxp.com%7C648ac45834db4c39759308d7bb1ff410%7C686ea1d3bc2
> b4c6fa92c
> > >
> d99c5c301635%7C0%7C0%7C637183618236375559&amp;sdata=Lc54HlLqjd
> e0WLmU
> > > Zp27s9JVic6IQTqt%2BKDaCYfQDGo%3D&amp;reserved=0,
> > > the need also exists to skip the load of the firmware on recovery.
> > > How to manage ROM/XIP Firmwares, no handling of the FW code only
> > > management of the live cycle (using sysfs, crash management ....)?
> > >
> >
> > A very good question, and something I need to think about after
> > reviewing Peng's patchset.  I will get back to you.
> 
> After reviewing Peng's patches it became clear to me using if/else statements
> will quickly become unmanageable - we need something flexible that can
> scale.  After spending a long time looking at what TI, NXP and ST have done
> to address their specific needs I think a solution is starting to take shape in my
> head.  From here I think the best way to proceed is for me to write a
> patchset that enacts those ideas and sent it out for review, something that
> should take me around
> 2 weeks.

Thanks for working on this. Looking forward your patches, then I'll rebase
my patches and give a test.

Thanks,
Peng.

> 
> >
> > > >
> > > > In my opinion the above would represent the state of the MCU
> > > > rather than the state of the FW used by the MCU.  It would also
> > > > provide an opening for supporting systems where the MCU is not the
> > > > life cycle manager.
> > > Not sure to catch your point here. By "above" you mention your proposal
> or mine?
> >
> > I was talking about the lines I wrote.
> >
> > > In my opinion, rproc->state already represents the MCU state what
> > > seems missing is the FW state Could you clarify what you mean by
> > > "systems where the MCU is not the life cycle manager" MCU = rproc
> > > framework?
> >
> > Arrgghh... That's a brain bug on my side.  It should have been AP, not MCU.
> >
> > >
> > > Regards
> > > Arnaud
> > >
> > > >
> > > > Let me know what you think...
> > > >
> > > >>
> > > >> I need to rework the patchset in consequence but i would appreciate
> your feedback on this proposal before, to be sure that i well interpreted your
> concerns...
> > > >>
> > > >> Regards,
> > > >> Arnaud
> > > >>
> > > >>>
> > > >>>> This is not necessary the case, even if EPROBE_DEFER is used. In this
> case the driver has to be build as kernel module.
> > > >>>>
> > > >>>> Thanks,
> > > >>>> Arnaud
> > > >>>>>
> > > >>>>> I'd welcome other people's opinion on this.
> > > >>>>>
> > > >>>>>>              ret = rproc_trigger_auto_boot(rproc);
> > > >>>>>>              if (ret < 0)
> > > >>>>>>                      return ret; diff --git
> > > >>>>>> a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > >>>>>> index 16ad66683ad0..4fd5bedab4fa 100644
> > > >>>>>> --- a/include/linux/remoteproc.h
> > > >>>>>> +++ b/include/linux/remoteproc.h
> > > >>>>>> @@ -479,6 +479,7 @@ struct rproc_dump_segment {
> > > >>>>>>   * @table_sz: size of @cached_table
> > > >>>>>>   * @has_iommu: flag to indicate if remote processor is behind
> an MMU
> > > >>>>>>   * @auto_boot: flag to indicate if remote processor should
> > > >>>>>> be auto-started
> > > >>>>>> + * @skip_fw_load: remote processor has been preloaded before
> > > >>>>>> + start sequence
> > > >>>>>>   * @dump_segments: list of segments in the firmware
> > > >>>>>>   * @nb_vdev: number of vdev currently handled by rproc
> > > >>>>>>   */
> > > >>>>>> @@ -512,6 +513,7 @@ struct rproc {
> > > >>>>>>      size_t table_sz;
> > > >>>>>>      bool has_iommu;
> > > >>>>>>      bool auto_boot;
> > > >>>>>> +    bool skip_fw_load;
> > > >>>>>>      struct list_head dump_segments;
> > > >>>>>>      int nb_vdev;
> > > >>>>>>  };
> > > >>>>>> --
> > > >>>>>> 2.17.1
> > > >>>>>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
